package com.exam.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.exam.dao.BbsDao;
import com.exam.dto.BbsDto;

public class BbsUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bbsId = req.getParameter("bbsId");
		BbsDao bbsDao = BbsDao.getInstance();
		BbsDto bbsDto = new BbsDto();
		bbsDto = bbsDao.selectById(bbsId);
		
		req.setAttribute("bbsupdate", bbsDto);
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/bbsupdate.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String bbsId = req.getParameter("bbsId");
		String bbsCategory = req.getParameter("bbsCategory");
		String bbsTitle = req.getParameter("bbsTitle");
		String bbsContent = req.getParameter("bbsContent");
		
		BbsDao bbsDao = BbsDao.getInstance();
		BbsDto bbsDto = new BbsDto();
		bbsDto.setBbsId(Integer.parseInt(bbsId));
		bbsDto.setBbsCategory(bbsCategory);
		bbsDto.setBbsTitle(bbsTitle);
		bbsDto.setBbsContent(bbsContent);
		
		bbsDao.update(bbsDto);
		resp.sendRedirect("bbs.do");
	}
	
}