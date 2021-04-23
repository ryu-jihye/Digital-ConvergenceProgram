package org.bean;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("*.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	
	public void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String stxPath = request.getContextPath();
		String cmd = uri.substring(stxPath.length());
		RequestDispatcher rd = null;
		BoardDAO dao = BoardDAO.getInstance();
		BoardVO vo = null;
		
		if(cmd.equals("/board/writeProc.do")) {
			
			String userId = request.getParameter("userId");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			vo = new BoardVO(userId, title, content);
			dao.insertBoard(vo);
			List<BoardVO> bList = dao.selectBoardAll();
			request.setAttribute("cnt", dao.getListCount());
			request.setAttribute("bList", bList);
			rd = request.getRequestDispatcher("list.jsp");
			rd.forward(request, response);
			
		}else if(cmd.equals("/board/listProc.do")) {

			List<BoardVO> bList = dao.selectBoardAll();
			request.setAttribute("cnt", dao.getListCount());
			request.setAttribute("bList", bList);
			rd = request.getRequestDispatcher("list.jsp");
			rd.forward(request, response);
			
		}else if(cmd.equals("/board/viewProc.do")) {
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			vo = dao.selectBoard(boardNo);
			request.setAttribute("vo", vo);
			rd = request.getRequestDispatcher("view.jsp");
			rd.forward(request, response);
		}
	}

}
