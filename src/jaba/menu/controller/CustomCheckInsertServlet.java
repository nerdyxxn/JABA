package jaba.menu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jaba.menu.model.service.MenuService;
import jaba.menu.vo.MenuVO;
import jaba.order.vo.OrderVO;

/**
 * Servlet implementation class CustomCheckInsertServlet
 */
@WebServlet("/menu/customChekcInsert.do")
public class CustomCheckInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomCheckInsertServlet() {
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
		
		System.out.println("ajax 통신해서 커스텀체크 서블릿 잘 작동함");
		String custom_name = request.getParameter("customCheckName");
		System.out.println("커스텀이름 : " + custom_name);
		MenuVO menuVo = (MenuVO)request.getSession().getAttribute("menuVo");
		String menu_id = menuVo.getMenu_id();
		System.out.println("해당 메뉴의 menu_id : " + menu_id);
		OrderVO orderVo = (OrderVO)request.getSession().getAttribute("orderVo");
		String order_id = orderVo.getOrder_id();
		
		MenuService mService = new MenuService();
		//mService.
		int customCheckExist = mService.insertCustomCheck(menu_id, custom_name, order_id);
		if( customCheckExist == 1) {
			System.out.println("서블릿에서 insert custom check 성공");
		}else {
			System.out.println("서블릿에서 insert custom check 실패");
		}
		
		// menuVo.menu_id와  custom_name 을 통해 custom_id를 알아내야함 
		// 서비스로 orderVo.order_id 와 
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
