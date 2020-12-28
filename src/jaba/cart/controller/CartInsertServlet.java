package jaba.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jaba.cart.model.service.CartService;
import jaba.order.vo.OrderVO;
import jaba.store.vo.StoreVO;

/**
 * Servlet implementation class CartInsertServlet
 */
@WebServlet("/cart/cartInsert.do")
public class CartInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartInsertServlet() {
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
		
		String cartId = null;
		int cart_total_price = 0;
		CartService cartService = new CartService();

		String cartIdExist = (String)request.getSession().getAttribute("cartId");
		if( cartIdExist == null) {
			cartId = cartService.insertCartNo();	// cartService.mmmmmmm();	파리미터 x 
			System.out.println("생성된 cartId : " + cartId);
			request.getSession().setAttribute("cartId", cartId);
		}else {
			cartId = (String)request.getSession().getAttribute("cartId");
			System.out.println("세션에있는 cartId : " + cartId);
		}
		// cartNo를 1 증가시킨다음 String 타입으로 cartNo를 받아옴 
		
		OrderVO orderVo = (OrderVO)request.getSession().getAttribute("orderVo");
		// orderVo에 quantity와 order_id가 있음 
		String order_id = orderVo.getOrder_id();
		
		// 세션에 담긴 storevo 를 참고해서 store_id를 가져옴 
		StoreVO storeVo = (StoreVO)request.getSession().getAttribute("storeVo");
		String store_id = storeVo.getStore_id();
		
		cart_total_price =  Integer.parseInt(request.getParameter("cart_total_price"));
		System.out.println("가져온 totalprice :  " + cart_total_price);
		
		// service에서 result로 체크를 해주기 때문에 함수호출만 해줌 --> void
		cartService.insertCart(order_id,cartId,store_id,cart_total_price);
		
		// order_id와 store_id와 cartNo를 가지고와서 quantity 
		
		// remove를 좀 해줍시다. 
		request.getSession().removeAttribute("menuVo");
		request.getSession().removeAttribute("orderVo");
		
		// menuVO요놈은 
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
