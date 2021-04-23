package com.conan.vo;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("*.do") //writeProc.do, listProc.do, viewProc.do 사용
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
		 try {
	         actionDo(request, response);
	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NamingException, SQLException {
	//cmd 추출
	request.setCharacterEncoding("utf-8");
	String uri = request.getRequestURI(); 
	String ctxPath = request.getContextPath(); 
	String cmd = uri.substring(ctxPath.length());
	RequestDispatcher rd = null;
	BoardDAO dao = BoardDAO.getInstance();
	
	if(cmd.equals("/board/writeProc.do")) {
		System.out.print("writeProc");
		
	} else if (cmd.equals("/board/listProc.do")) {//게시글 목록에 디비에서 불러와서 list.jsp에 출력하기
		System.out.println("list");
		List<BoardVO> bList = dao.selectBoardAll(); //BoardDAO 내 게시글 전체 목록 반환 불러옴
		request.setAttribute("cnt", dao.getListCount()); //BoardDAO 내 게시글 개수 반환
		request.setAttribute("bList", bList);
		
		System.out.println("controller : "+bList.get(0).getBoardNo());
		rd = request.getRequestDispatcher("/board/list.jsp"); //list.jsp로 이동
		rd.forward(request, response);
		System.out.print("listProc");
		
	} else if (cmd.equals("/board/viewProc.do")) {
		//패러미터 추출해서 게시글 번호에 해당하는 글 조회수 증가하기, 불러와서 view.jsp에 출력하기
		request.setCharacterEncoding("utf-8");
		//boardNo 추출하기
		Integer boardNo = Integer.parseInt(request.getParameter("boardNo"));
		dao.increaseHit(boardNo); //dao에서 사용할 값 추출(조회수 증가)
		BoardVO vo = dao.selectBoard(boardNo); // //특정 게시글 정보 반환 
		request.setAttribute("vo", vo); //.setAttribute()는 선택한 요소(element)의 속성(attribute) 값을 정합니다. ex) element.setAttribute( 'a'(속성이름), 'b'(속성값)); )
		
		//dispatcher.forward : 클라이언트가 요청하면서 전송한 데이터를 그대로 유지
		//sendRedirect() : 새로운 페이지로 완전히 이동, 기존 데이털ㄹ 하나도 사용 불가
		rd = request.getRequestDispatcher("/board/view.jsp"); //view.jsp로 이동
		rd.forward(request, response);
		System.out.print("viewProc");
	}
	
	}
}
