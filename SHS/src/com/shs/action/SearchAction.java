package com.shs.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shs.dto.MemberDTO;

public class SearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "shs_search.jsp";
		
		List<MemberDTO> list = new ArrayList<>();
		// 비어있는 ArrayList를 만들었다. 안에있는 데이터가 없으니까, '검색결과가 없습니다'를 띄어줌
		request.setAttribute("shslist", list);
		
		ActionForward forward = new ActionForward();
		// 객체생성
		forward.setPath(url);
		forward.setRedirect(false);
		//forward 방식으로 보냄
		
		return forward;
		// forward => Path와 isRedirect값을 보낸 다.
	}
	
}
