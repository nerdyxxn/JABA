package jaba.store.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jaba.store.model.service.DBoardService;
import jaba.store.vo.DBoardVO;

/**
 * Servlet implementation class SelectStoreServlet
 */
@WebServlet("/SelectStore.do")
public class SelectStoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectStoreServlet() {
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
		
		
		// store_name 을 파라미터로 가져옴 
		String store_name = request.getParameter("storename");
		
		DBoardService dService = new DBoardService();
		List<DBoardVO> dboardList = dService.getStoreFirstBoard(store_name);
		if(dboardList == null) {
			System.out.println("store에 게시글이 없습니다.");
		}
		System.out.println("store 게시판 불러오기 성공");
		request.getSession().setAttribute("dboardList", dboardList);
		
		// 메뉴리스트~~~
		request.getRequestDispatcher("/menu.jsp").forward(request, response);
		
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
