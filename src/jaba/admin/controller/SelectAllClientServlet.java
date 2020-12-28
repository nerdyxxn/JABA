package jaba.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jaba.admin.model.service.AdminService;
import jaba.client.model.service.ClientService;
import jaba.client.vo.ClientVO;
import jaba.store.model.service.StoreService;
import jaba.store.vo.StoreVO;

/**
 * Servlet implementation class SelectAllClient
 */
@WebServlet("/admin/selectAllClient.do")
public class SelectAllClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectAllClientServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @throws ServletException, IOException 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
	
			System.out.println("clientList--explore 연결 서블릿");
			AdminService aService = new AdminService(); // AdminService 생성
			List<ClientVO> clientList = aService.selectAllClient(); // 와 같은 작업을 해줌
			request.getSession().setAttribute("clientList", clientList); // clientList를 세션으로 넘김
			System.out.println("client list 작동");
		
		out.flush();
		out.close();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
