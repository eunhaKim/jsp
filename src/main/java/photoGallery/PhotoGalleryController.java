package photoGallery;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.ptg")
public class PhotoGalleryController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PhotoGalleryInterface command = null;
		String viewPage = "/WEB-INF/photoGallery";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		// 인증....처리.....
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
		
		if(level > 4) {
			request.setAttribute("message", "로그인후 사용하세요");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/PhotoGallery")) {
			command = new PhotoGalleryCommand();
			command.execute(request, response);
			viewPage += "/photoGalleryList.jsp";
		}
		else if(com.equals("/PhotoGalleryInput")) {
			viewPage += "/photoGalleryInput.jsp";
		}
//		else if(com.equals("/PhotoGalleryInputOk")) {
//			command = new PhotoGalleryInputOkCommand();
//			command.execute(request, response);
//			viewPage = "/include/message.jsp";
//		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);		
	}
}
