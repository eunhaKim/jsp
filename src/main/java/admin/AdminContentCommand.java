package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberVO;

public class AdminContentCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDAO dao = new AdminDAO();
		ArrayList<MemberVO>	vos = null;
		
		// 신규회원(준회원)
		vos	= dao.getMemberList(1);
		request.setAttribute("newMemberCnt", vos.size());
		
		// 탈퇴회원
		vos	= dao.getMemberList(99);
		request.setAttribute("delMemberCnt", vos.size());
	}

}
