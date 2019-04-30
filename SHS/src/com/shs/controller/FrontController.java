package com.shs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shs.action.Action;
import com.shs.action.ActionForward;
import com.shs.action.IndexAction;
import com.shs.action.InsertAction;
import com.shs.action.InsertPlayAction;
import com.shs.action.WelcomeAction;

/**
 * Servlet implementation class FrontController
 */

//FrontController패턴
//앞단에서 Controller역할을 하는 Servlet 1개만 생성 후 생성된 1개의 서블릿이 리퀘스트와 리스폰스를 모두 처리하고,
//실제 동작하는 액션부분만 클래스로 여러개 생성해서 사용하는방법. 기존의 동작마다 서블릿을생성하던 방식에 비해 효율성이 큼.
@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	// doGet(), doPost() 모두 service()로 통해서 작동하게
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글깨짐 방지(POST방식): 가장 위에 적어야 함
		request.setCharacterEncoding("UTF-8");
		
		Action action = null;
		ActionForward forward = null; // action에서보낸 forward값이 담겨있음(path, isRedirect값)
		
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length());
		//substring=>문자열을 빼라는 것. 문자열을 빼는데,ctx.length()=>ctx의 길이만큼 빼라
		//즉, uri와 ctx에서 겹치는 부분을 빼라는 것.
		// uri에서 ctx를 빼면 내가 원하는 소스만 뽑을 수 있다.
		
		System.out.println("uri>>>" + uri);
		System.out.println("ctx>>>" + ctx);
		System.out.println("cmd>>> "+ command);
		// 위의 코드 콘솔창 출력결과
		// uri>>>/SHS/index.shs
		// ctx>>>/SHS
		// cmd>>> /index.shs
		
		
		if(command.equals("/index.shs")) {
			action = new IndexAction();
			//위는 객체생성을 한 것
			forward = action.execute(request, response);
		} else if(command.equals("/insert.shs")) {
			action = new InsertAction();
			forward = action.execute(request, response);
		} else if(command.equals("/insertPlay.shs")) {
			action = new InsertPlayAction();
			// ***Play => 실제로 동작하는 화면을 출력하는 것
			// 여기서는 실제 데이터를 입력하는 동작을 담당하는 화면을 출력하는 것이다.
			forward = action.execute(request, response);
		} else if(command.equals("/welcome.shs")) {
			action = new WelcomeAction();
			// ***Play => 실제로 동작하는 화면을 출력하는 것
			// 여기서는 실제 데이터를 입력하는 동작을 담당하는 화면을 출력하는 것이다.
			forward = action.execute(request, response);
		}
		
		
		// -------공통분기작업--------
		if(forward !=null) {
			if(forward.isRedirect()) {
				// page전환시 redirect방식
				//Action forward class의 isRedirect함수 실행 => flase값을 가져옴
				// false니까 if문 안타고 다음 else를 바로 탐
				response.sendRedirect(forward.getPath());
			} else {
				// page전환시 forward방식
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				// forward.getPath()=>다음의 함수실행 => shs_index.jsp
				rd.forward(request,response);
			}
		}
		
		
		
		
		
		
		
		
		
	}

}
