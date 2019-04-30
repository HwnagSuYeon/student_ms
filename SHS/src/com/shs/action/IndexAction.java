package com.shs.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "shs_index.jsp";
		
		ActionForward forward = new ActionForward();
		// 객체생성
		forward.setPath(url);
		forward.setRedirect(false);
		//forward 방식으로 보냄
		
		return forward;
		// forward => Path와 isRedirect값을 보낸 다.
	}
	
	
}
