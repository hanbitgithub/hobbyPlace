package com.hp.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.qna.model.service.QnaService;
import com.hp.qna.model.vo.Qna;

/**
 * Servlet implementation class TuteeQnaInsertController
 */
@WebServlet("/insertQna.tee")
public class TuteeQnaInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TuteeQnaInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String grade = request.getParameter("questType");
		int clNo = Integer.parseInt(request.getParameter("schQnaType"));
		String content = request.getParameter("content");
		int aMemNo = Integer.parseInt(request.getParameter("aMemNo"));
		
		Qna q = new Qna();
		q.setqMemNo(no);
		q.setqTitle(title);
		q.setqGrade(grade);
		q.setClNo(clNo);
		q.setqContent(content);
		q.setaMemNo(aMemNo);
		
	    int result = 0;
		if(grade.equals("0")) {
			result = new QnaService().insertTuteeQna(q);
		}else {
			 result = new QnaService().insertTuteeQnaTutor(q);
		}
		
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/qnaList.tee");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
