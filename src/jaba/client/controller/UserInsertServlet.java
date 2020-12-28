package jaba.client.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jaba.client.model.service.ClientService;

/**
 * Servlet implementation class UserInsertServlet
 */
@WebServlet("/client/clientRegister.do")
public class UserInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get 요청은 막아야할것같은데.. 
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_name = request.getParameter("user_name");
		String user_phone = request.getParameter("user_phone");
		
		// 유효성체크를 jsp에서? 서블릿에서 ? 
		ClientService cService = new ClientService(); //먼저 clientService 호출
		int result = 0;		// 회원가입 결과 
		result = cService.insertClient(user_id, user_pw, user_name, user_phone);
		if(result == 1) {	// 성공
			out.print("registerOk");
			System.out.println("UserInsertServlet : " + user_id + " 회원가입 성공");
		}else {
			out.print("registerFail");
			System.out.println("UserInsertServlet : " + user_id + " 회원가입 실패");
		}
		
		out.flush();
		out.close();
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
