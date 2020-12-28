package jaba.client.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jaba.admin.model.service.AdminService;
import jaba.client.model.service.ClientService;
import jaba.store.model.service.StoreService;

/**
 * Servlet implementation class ClientCheckIdServlet
 */
@WebServlet("/client/clientCheckId.do")
public class ClientCheckIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientCheckIdServlet() {
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
		
		String user_id = request.getParameter("emailRegister");
		
		ClientService cService = new ClientService();
		StoreService sService = new StoreService();
		AdminService aService = new AdminService();
		if(cService.selectIdCheck(user_id)==2 && sService.selectIdCheck(user_id)==2 && aService.selectIdCheck(user_id)==2) {
			out.print("ok");
			System.out.println("사용가능한 email입니다.");
		}else {
			out.print("no");
			System.out.println("사용불가능한 email입니다.");
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
