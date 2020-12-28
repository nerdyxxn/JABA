package jaba.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jaba.admin.model.service.AdminService;
import jaba.store.vo.StoreVO;

/**
 * Servlet implementation class SelectAllStoreServlet
 */
@WebServlet("/admin/selectAllStore.do")
public class SelectAllStoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllStoreServlet() {
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
	
			System.out.println("storeList--explore 연결 서블릿");
			AdminService aService = new AdminService(); // AdminService 생성
			List<StoreVO> storeList = aService.selectAllStore(); // 와 같은 작업을 해줌
			request.getSession().setAttribute("storeList", storeList); // clientList를 세션으로 넘김
			System.out.println("store list 작동");
		
		out.flush();
		out.close();

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
