package jaba.client.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jaba.client.model.service.ClientService;
import jaba.client.vo.ClientVO;

/**
 * Servlet implementation class UserPwUpdateServlet
 */
@WebServlet("/member/myPwUpdate.do")
public class UserPwUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPwUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String user_pw = request.getParameter("user_pw");
		// 기존유저의 정보와, user_id를 얻어오기 위해서 vo를 얻어옴
		ClientVO clientVo = (ClientVO)request.getSession().getAttribute("clientVo");
		ClientService cService = new ClientService();
		cService.updateClientPw(clientVo.getUser_id(), user_pw);
		
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
