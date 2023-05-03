package recipe.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recipe.dao.RecipeBoardDAO;
import recipe.dao.RecipeBoardGoodDAO;
import recipe.dto.RecipeBoardDTO;
import recipe.dto.RecipeBoardGoodDTO;

@WebServlet("/recipeBoardGood_servlet/*")
public class RecipeBoardGoodController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String page = path;
		RecipeBoardGoodDAO dao = new RecipeBoardGoodDAO();
		if(uri.indexOf("good.do") != -1) {
			HttpSession session = request.getSession();
			String id = "";
			if(session.getAttribute("id") != null) {
				id = (String)session.getAttribute("id");
			}
			int num = Integer.parseInt(request.getParameter("num"));
			RecipeBoardGoodDTO dto = new RecipeBoardGoodDTO();
			dto.setId(id);
			dto.setNum(num);
			int count = dao.goodCheck(dto);
			request.setAttribute("count", count);
			RecipeBoardDTO boardDto = new RecipeBoardDTO();
			RecipeBoardDAO boardDao = new RecipeBoardDAO();
			boardDto = boardDao.viewContent(num);
			request.setAttribute("dto", boardDto);
			page = "/recipe/recipeBoardGood/good.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
