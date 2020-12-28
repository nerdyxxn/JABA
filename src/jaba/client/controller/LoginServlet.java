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
import jaba.store.vo.StoreVO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/client/clientLogin.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("email");
		String user_pw = request.getParameter("pwd");
		PrintWriter out = response.getWriter();
		
		ClientService cService = new ClientService(); //먼저 clientService 호출
		
		if(cService.selectLogin(user_id, user_pw) == 1) { // 가지고온 user_id와 user_pw를 ClientVO에 저장된 정보들과 대조
//			.selectLogin(user_id, user_pw)
			request.getSession().setAttribute("user_id", user_id); // 이제 받아온 user_id를 user_id로 지칭하고 던질 준비
//			out.println("<script>alert(' α  μ   ')</script>");
			System.out.println("Client 로그인 성공");
			String user_name = cService.returnName(user_id);
			out.print("Client");
		}else {
			// client에 회원정보 없음 --> store 정보를 검색
			StoreService sService = new StoreService();
			if(sService.selectLogin(user_id, user_pw) == 1) { //해당 정보 존재를 확인만 하는 것
				request.getSession().setAttribute("store_id", user_id); // store 
				StoreService sService2 = new StoreService(); //Connection이 해제되는 메소드가 존재해서 한 번 더 호출해줘야 한다.
				StoreVO storeVo =  sService2.selectStore(user_id, user_pw);
				request.getSession().setAttribute("storeVo", storeVo);	// (자신의) 가게 정보를 가지고 이동.
				System.out.println("Store 로그인 성공");
				System.out.println("bizMain으로 이동");
				out.print(user_id);	// println 하면 안됨.
			}else {
				AdminService aService = new AdminService();
				if(aService.selectLogin(user_id, user_pw) == 1) {
					request.getSession().setAttribute("admin_id", user_id);
					System.out.println("Admin 로그인 성공");
					System.out.println("adminMain으로이동");
					out.print("Admin");
				}else {
					out.print("NotExist");
					System.out.println("일치하는 회원정보 없음."); //3가지 VO를 뒤져도 일치하는 회원정보가 없을 때
				}
			}
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