package jaba.order.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jaba.menu.vo.MenuVO;
import jaba.order.service.OrderService;
import jaba.order.vo.OrderVO;

/**
 * Servlet implementation class OrderInsertServlet
 */
@WebServlet("/order/orderInsert.do")
public class OrderInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderInsertServlet() {
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
		
		String user_id = (String)request.getSession().getAttribute("user_id");
		MenuVO menuvo = (MenuVO)request.getSession().getAttribute("menuVo");
		String menu_id = menuvo.getMenu_id();
		if(user_id != null) {
			int order_quantity = Integer.parseInt(request.getParameter("quantity"));
			
			// user_id와 menu_id 제대로 긁어오는지 테스트
			System.out.println("orderInsert서블릿 user_id : " + user_id);
			System.out.println("orderInsert서블릿 menu_id : " + menu_id);
			System.out.println("orderInsert서블릿 order_quantity : " + order_quantity);
			// 확인완료
			
			// 서비스 생성 
			OrderService oService = new OrderService();
			// ordervo new 해서 생성 
			OrderVO ordervo = new OrderVO();
			
			ordervo = oService.insertOrder(user_id, menu_id, order_quantity);
			// insert 하고 order 정보를 OrderVo 데이터타입으로 세션에 저장
			request.getSession().setAttribute("orderVo", ordervo);
		}else {
			System.out.println("user_id가 없어서 orderInsert 실행하지 않음");
			out.print("OrderFail");
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
