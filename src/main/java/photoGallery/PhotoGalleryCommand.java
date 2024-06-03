package photoGallery;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PhotoGalleryCommand implements PhotoGalleryInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part=request.getParameter("part")==null ? "전체" : request.getParameter("part");
		String choice=request.getParameter("choice")==null ? "최신순" : request.getParameter("choice");
		
		PhotoGalleryDAO dao = new PhotoGalleryDAO();
		
		ArrayList<PhotoGalleryVO> vos = dao.getPhotoGalleryList();
		
		request.setAttribute("vos", vos);
		request.setAttribute("part", part);
		request.setAttribute("choice", choice);
	}

}
