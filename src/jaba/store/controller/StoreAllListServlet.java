package jaba.store.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jaba.store.model.service.StoreService;
import jaba.store.vo.StoreVO;

/**
 * Servlet implementation class StoreAllListServlet
 */
@WebServlet("/store/storeSearch.do")
public class StoreAllListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreAllListServlet() {
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
		// ?뒤에 값을 받아와서 셋팅해준다. 
		String brand = request.getParameter("brand");
		String city = request.getParameter("city");
//		String path = request.getContextPath();
		
		// 현재 위치 받아옴
				String lat2Str = request.getParameter("lat2");
				String lon2Str = request.getParameter("lon2");
				System.out.println("현재위치 : " + lat2Str);
				System.out.println("현재위치 : " + lon2Str);
				double lat2 = Double.parseDouble(lat2Str);
				double lon2 = Double.parseDouble(lon2Str);
				
		//해당 req.para ~ 값이 없으면 null 이다. 
		if(brand != null) {	// brand가 not null이면 익스플로러에 brand?
			System.out.println(brand);
			System.out.println("storeList--explore 연결 서블릿 : brand명 검색");
			StoreService sService = new StoreService();	// StoreService 생성
			List<StoreVO> storeList = sService.selectList(brand);	// 와 같은 작업을 해줌 
//			System.out.println(storeList);
//			Collections.sort(storeList);
//			System.out.println(storeList);
			
			// 여기서 계산해서 
			//List<Double> dList = new ArrayList<Double>();
			
			for(int i=0; i<storeList.size(); i++) {
				StoreVO vo = storeList.get(i);
				double lat1 = Double.parseDouble(vo.getStore_lat());
				double lon1 = Double.parseDouble(vo.getStore_lng());				
				double d = Math.round(getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2)*10)/10.0;
				vo.setDistance(d);				
				//dList.add(d);
			}
			
			System.out.println("aaa:" + storeList);
			Collections.sort(storeList); //오름차순 정리
			System.out.println("bbb:" + storeList);
			
			request.getSession().setAttribute("storeList", storeList);	// StoreList를 세션으로 넘김  
			
			 // 라고치고 해당 url로 forward로 이동~~~ 
			System.out.println("brand부분 작동");
			RequestDispatcher disp = request.getRequestDispatcher("/explore.jsp");
//			RequestDispatcher disp = request.getRequestDispatcher("./explore.jsp/?brand=" + brand);
			disp.forward(request, response);
			
			
		}
		if(city != null) {
			System.out.println(city);
			System.out.println("storeList--explore 연결 서블릿 : city명 검색");
			StoreService sService = new StoreService();	// StoreService 생성
			List<StoreVO> storeList = sService.selectList(city);	// 와 같은 작업을 해줌 
			for(int i=0; i<storeList.size(); i++) {
				StoreVO vo = storeList.get(i);
				double lat1 = Double.parseDouble(vo.getStore_lat());
				double lon1 = Double.parseDouble(vo.getStore_lng());				
				double d = Math.round(getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2)*10)/10.0;
				vo.setDistance(d);				
				//dList.add(d);
			}
			
			System.out.println("aaa:" + storeList);
			Collections.sort(storeList); //오름차순 정리
			System.out.println("bbb:" + storeList);
			
			request.getSession().setAttribute("storeList", storeList);	// StoreList를 세션으로 넘김  
			
			 // 라고치고 해당 url로 forward로 이동~~~ 
			System.out.println("city부분 작동");
			RequestDispatcher disp = request.getRequestDispatcher("/explore.jsp");
//			RequestDispatcher disp = request.getRequestDispatcher("./explore.jsp/?brand=" + brand);
			disp.forward(request, response);
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
	private double deg2rad(double deg) {
		return deg * (Math.PI/180) ;
	}
	private float getDistanceFromLatLonInKm(double lat1, double lng1, double lat2, double lng2) {
		int R = 6371; // Radius of the earth in km 
		double dLat = deg2rad(lat2-lat1); // deg2rad below 
		double dLon = deg2rad(lng2-lng1); 
		double a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2); 
		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
		System.out.println(c);
		float d = R * (float)c; // Distance in km 
		System.out.println(d);
		return d;
   }


}
