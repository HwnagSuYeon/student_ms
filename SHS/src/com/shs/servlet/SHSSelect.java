package com.shs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shs.dao.MemberDAO;
import com.shs.dto.MemberDTO;

/**
 * Servlet implementation class SHSSelect
 */
@WebServlet("/SHSSelect")
public class SHSSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SHSSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET: 출석부출력");
		
		MemberDAO mDao = MemberDAO.getInstance();
		List<MemberDTO> list = mDao.memSelect();
		
		// servlet에서 페이지 이동방법 2가지
		// 1)redirect : 페이지 이동시 실질적인 이동이 이루어진다.(앵커태그의 타겟 블랭크와 비슷한 느낌. 기존의 떠있는 페이지에서 다른페이지로의 이동이 있음)
		// 2)forward : 페이지 이동시 실질적 이동이 이루어지지 않고, 새로운 페이지를 덮어씌운다.(기존에 떠있는 페이지 위에 새로운 페이지를 띄움)
		// setAttribute(이름표,실제값)=> 값을 여러개 받는 역할. 값을 담는 역할만 한다.
		request.setAttribute("shslist", list);
		
		RequestDispatcher dis = request.getRequestDispatcher("shs_select.jsp");
		dis.forward(request, response);
		
//		response.sendRedirect("shs_select.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
