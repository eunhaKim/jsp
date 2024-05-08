package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.do5")
public class Test5Controller extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Test4Interface command = null;
		String viewPage = "/WEB-INF/study2/mapping/";
		
		String uri= request.getRequestURI();
		
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		if(com.equals("test5")) {
			
			viewPage += com + ".jsp";
		}
		else if(com.equals("list")) {
			command = new Test4ListCommand();
			command.execute(request, response);
			viewPage += com + ".jsp";
		}
		else if(com.equals("input")) {
			
			viewPage += com + ".jsp";
		}
		else if(com.equals("inputOk")) {
			command = new Test4InputOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/common/message.jsp";
		}
		else if(com.equals("update")) {
			command = new Test4UpdateCommand();
			command.execute(request, response);
			viewPage += com + ".jsp";
		}
		else if(com.equals("updateOk")) {
			command = new Test4UpdateOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/common/message.jsp";
		}
		else if(com.equals("delete")) {
			command = new Test4DeleteCommansd();
			command.execute(request, response);
			viewPage += com + ".jsp";
		}
		else if(com.equals("deleteOk")) {
			command = new Test4DeleteOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/common/message.jsp";
		}
		else if(com.equals("search")) {
			command = new Test4Search();
			command.execute(request, response);
			viewPage += com + ".jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
