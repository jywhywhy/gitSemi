package recipe.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recipe.dao.RecipeBoardCommentDAO;
import recipe.dto.RecipeBoardCommentDTO;

@WebServlet("/recipeBoardComment_servlet/*")
public class RecipeBoardCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String page = path;
		RecipeBoardCommentDAO dao = new RecipeBoardCommentDAO();
		if(uri.indexOf("list.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			List<RecipeBoardCommentDTO> list = dao.list(num);
			request.setAttribute("list", list);
			page = "/recipe/recipeBoardComment/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("update.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			int comment_num = Integer.parseInt(request.getParameter("comment_num"));
			String content = request.getParameter("content");
			RecipeBoardCommentDTO dto = new RecipeBoardCommentDTO();
			dto.setComment_num(comment_num);
			dto.setContent(content);
			dao.update(dto);
			page += "/recipeBoard_servlet/viewContent.do?num="+num;
			response.sendRedirect(page);
		}else if(uri.indexOf("delete.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			int comment_num = Integer.parseInt(request.getParameter("comment_num"));
			dao.updateShow(comment_num);
			page += "/recipeBoard_servlet/viewContent.do?num="+num;
			response.sendRedirect(page);
		}else if(uri.indexOf("insert.do") != -1) {
			HttpSession session = request.getSession();
			int num = Integer.parseInt(request.getParameter("num_"));
			String id = (String)session.getAttribute("id");
			String content = request.getParameter("content_");
			RecipeBoardCommentDTO dto = new RecipeBoardCommentDTO();
			dto.setNum(num);
			dto.setId(id);
			dto.setContent(content);
			dao.insert(dto);
			page += "/recipeBoard_servlet/viewContent.do?num="+num;
			response.sendRedirect(page);
		}else if(uri.indexOf("insertComment") != -1) {
			HttpSession session = request.getSession();
			int comment_num = Integer.parseInt(request.getParameter("comment_num"));
			String content = request.getParameter("content2");
			String id = (String)session.getAttribute("id");
			RecipeBoardCommentDTO dto = new RecipeBoardCommentDTO();
			dto = dao.view(comment_num);
			int ref = dto.getRef();
			int re_step = dto.getRe_step()+1;
			int re_level = dto.getRe_level()+1;
			dto.setId(id);
			dto.setContent(content);
			dto.setRef(ref);
			dto.setRe_step(re_step);
			dto.setRe_level(re_level);
			dao.updateStep(ref, re_step);
			dao.insertComment(dto);
			page += "/recipeBoard_servlet/viewContent.do?num="+dto.getNum();
			response.sendRedirect(page);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
}
