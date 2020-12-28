package jaba.store.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jaba.store.model.service.DBoardService;
import jaba.store.vo.DBoardVO;

/**
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/boardUpdate.lo")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	private void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		try { 
			//내장객체
			DBoardVO vo = new DBoardVO();
			// hidden으로 들고 들어온 데이터 - 원본글, 댓글에 대한 정보를 가지고 있음.
			vo.setBno(Integer.parseInt(request.getParameter("bno")));
			vo.setBref(Integer.parseInt(request.getParameter("bref")));
			vo.setBre_step(Integer.parseInt(request.getParameter("bre_step")));
			vo.setBre_level(Integer.parseInt(request.getParameter("bre_level")));
			// 직접 입력한 데이터들
			vo.setBwriter(request.getParameter("bwriter"));
			vo.setBsubject(request.getParameter("bsubject"));
			vo.setBcontent(request.getParameter("bcontent"));
			vo.setBfilepath(request.getParameter("bfilepath"));
			vo.setBpwd(request.getParameter("bpwd"));
			
			DBoardService dService = new DBoardService();
			int result = dService.writeBoard(vo);
			if(result>1) {
				response.sendRedirect("boardList");
			} else {
				request.getRequestDispatcher("/bwrite.jsp").forward(request, response);
			}
		} catch (NumberFormatException e) {
			request.getRequestDispatcher("/bwrite.jsp").forward(request, response);
		} catch (NullPointerException e) {
			request.getRequestDispatcher("/bwrite.jsp").forward(request, response);
		}
		
	}
}
