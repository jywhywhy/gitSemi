package recipe.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.internal.build.AllowSysOut;

import page.Pager;
import recipe.dao.RecipeMessageDAO;
import recipe.dto.RecipeMessageDTO;

@WebServlet("/recipeMessage_servlet/*")
public class RecipeMessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String page = path;
		RecipeMessageDAO dao = new RecipeMessageDAO();
		if(uri.indexOf("write.do") != -1) {
			String referer = request.getHeader("referer");
			referer = referer.substring(28);
			HttpSession session = request.getSession();
			String receiver = request.getParameter("receiver");
			String sender = (String)session.getAttribute("id");
			String content = request.getParameter("content");
			RecipeMessageDTO dto = new RecipeMessageDTO();
			dto.setReceiver(receiver);
			dto.setSender(sender);
			dto.setContent(content);
			dao.write(dto);
			page += referer;
			response.sendRedirect(page);
		}else if(uri.indexOf("list.do") != -1) {
			HttpSession session = request.getSession();
			String receiver = (String)session.getAttribute("id");
			int count = 0;
			count = dao.count(receiver);
			int curPage = 1;
			if(request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			List<RecipeMessageDTO> list = dao.list(start, end, receiver);
			request.setAttribute("page", pager);
			request.setAttribute("list", list);
			request.setAttribute("count", list.size());
			page = "/recipe/recipeMessage/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("answer.do") != -1) {
			HttpSession session = request.getSession();
			String receiver = request.getParameter("sender");
			String sender = (String)session.getAttribute("id");
			String content = request.getParameter("answerContent");
			RecipeMessageDTO dto = new RecipeMessageDTO();
			dto.setReceiver(receiver);
			dto.setSender(sender);
			dto.setContent(content);
			dao.write(dto);
			page += "/recipeMessage_servlet/list.do";
			response.sendRedirect(page);
		}else if(uri.indexOf("read.do") != -1) {
			int mnum = Integer.parseInt(request.getParameter("mnum"));
			dao.read(mnum);
		}else if(uri.indexOf("checkDelete.do") != -1) {
			String[] check = request.getParameterValues("check");
			for(int i = 0; i < check.length; i++) {
				int mnum = Integer.parseInt(check[i]);
				dao.delete(mnum);
			}
			page += "/recipeMessage_servlet/list.do";
			response.sendRedirect(page);
		}else if(uri.indexOf("newMessage.do") != -1) {
			HttpSession session = request.getSession();
			String receiver = (String)session.getAttribute("id");
			int result = dao.newMessage(receiver);
			PrintWriter out = response.getWriter();
			if(result > 0) {
				out.write(1+"");
			}else {
				out.write(0+"");
			}
		}
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
