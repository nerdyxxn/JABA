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
 * Servlet implementation class UserProfileUpdateServlet
 */
@WebServlet("/member/myPageUpdate.do")
public class UserProfileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfileUpdateServlet() {
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
		String user_name = request.getParameter("user_name");
		String user_phone = request.getParameter("user_phone");
		int user_birth = Integer.parseInt(request.getParameter("user_birth"));
		int user_gender = Integer.parseInt(request.getParameter("user_gender"));
		// 기존유저의 정보와, user_id를 얻어오기 위해서 vo를 얻어옴
		ClientVO clientVo = (ClientVO)request.getSession().getAttribute("clientVo");
		// 원래 있던 정보와 같은지 확인하고 다를경우에 update를 수행
		if((!user_name.equals(clientVo.getUser_name())) || (!user_phone.equals(clientVo.getUser_phone())) || (user_birth != clientVo.getUser_birth()) || (user_gender != clientVo.getUser_gender())) {
			ClientService cService = new ClientService();
			cService.updateClient(clientVo.getUser_id(), user_name, user_phone, user_gender, user_birth);
			System.out.println("Client Profile Update 성공");
		}else {
			System.out.println("기존정보와 다른정보가 없음.");
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
