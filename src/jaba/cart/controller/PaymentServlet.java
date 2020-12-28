package jaba.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jaba.cart.model.service.CartService;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/cart/paymentInsert.do")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
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
		// pay_request 받아옴
		String pay_request = request.getParameter("pay_request");
		System.out.println("서블릿 - pay_request : " + pay_request);
		String cart_id = (String) request.getSession().getAttribute("cartId");
		System.out.println("서블릿 - cart_id : " + cart_id);
		int pay_total_price = (int)request.getSession().getAttribute("total_price");
		System.out.println("서블릿 - pay_total_price : " + pay_total_price);
		
		CartService cartService = new CartService();
		
//		insertPayment(String cart_id, int pay_total_price, String pay_request) 을 하려면 
		cartService.insertPayment(cart_id, pay_total_price, pay_request);
		
		// REMOVE를 해야해요 
	      // remove를 좀 해줍시다. 
	      request.getSession().removeAttribute("cartId");
	      request.getSession().removeAttribute("total_price");
	      request.getSession().removeAttribute("storeVo");
	      request.getSession().removeAttribute("cartViewList");
	      request.getSession().removeAttribute("cartList");
	      request.getSession().removeAttribute("cartViewVoList");
	      
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
