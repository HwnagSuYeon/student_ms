package com.shs.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shs.dao.MemberDAO;
import com.shs.dto.MemberDTO;

public class InsertPlayAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";

		// 다음의 변수명은 DTO에서 만들었던 변수명과 똑같게 하는게 편하다.
		String sname = request.getParameter("input_name");
		int sage = Integer.parseInt(request.getParameter("input_age"));
		String smajor = request.getParameter("input_major");
		String sphone = request.getParameter("input_phone");

		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO mDto = new MemberDTO(sname, sage, smajor, sphone);
		int result = mDao.memInsert(mDto);

		if (result > 0) {
			url="welcome.shs";
		} else {
			url = "insert.jsp"; //sendRedirect방식=>DB작업했을 때는 덮어씌우지 말고(forward) 새로 페이지를 띄워라
		}

		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);

		return forward;
	}

}
