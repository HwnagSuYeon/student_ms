package com.shs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shs.dao.MemberDAO;
import com.shs.dto.MemberDTO;

/**
 * Servlet implementation class SHSUpdate
 */
@WebServlet("/SHSUpdate")
public class SHSUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SHSUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET: 학생수정페이지 출력");
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("id=" + id);
		
		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO mDto = mDao.memInfo(id);
		System.out.println(mDto.toString());
		
		request.setAttribute("memInfo", mDto);
		RequestDispatcher dis = request.getRequestDispatcher("shs_update.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("POST:학생정보 수정");
		// 한글 깨짐 방지코드
		request.setCharacterEncoding("UTF-8");
		// 받아올때는 무조건 =request/ 여기서 정보를 꺼내야하니까 getParameter
		// 근데 받아오는 값은 무조건 String이다. 그러니까 int값이 필요하면 integer가 필요.
		// 변수명은 DTO내의 변수명과 맞춰주자. 그래야 헷갈리지 않음.
		int sid = Integer.parseInt(request.getParameter("input_id"));
		String sname = request.getParameter("input_name");
		int sage = Integer.parseInt(request.getParameter("input_age"));
		String smajor = request.getParameter("input_major");
		String sphone = request.getParameter("input_phone");
		
		// 다음은 값을 제대로 가져왔나 확인하는 코드이다.
		// DTO생성자 안에 변수의 값을 넣어줌으로써 toString으로 값의 확인이 가능하게 만들어준다.
		MemberDTO mDto = new MemberDTO(sid, sname, sage, smajor, sphone);
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.memUpdate(mDto);
		if (result > 0) {
			response.sendRedirect("SHSSelect");
		}
		// toString으로 값을 가져왔는지 확인하려면 변수안에 값이 담겨있어야한다.
		// System.out.println(mDto.toString());
		
		
	}

}
