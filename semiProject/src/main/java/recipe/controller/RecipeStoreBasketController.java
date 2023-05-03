package recipe.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recipe.dao.RecipeMemberAddressDAO;
import recipe.dao.RecipeMemberDAO;
import recipe.dao.RecipeStoreBasketDAO;
import recipe.dto.RecipeStoreBasketDTO;

@WebServlet("/recipeStoreBasket_servlet/*")
public class RecipeStoreBasketController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String page = path;
		RecipeStoreBasketDAO dao = new RecipeStoreBasketDAO();
		if(uri.indexOf("insert.do") != -1) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			int snum = Integer.parseInt(request.getParameter("snum"));
			int amount = Integer.parseInt(request.getParameter("amount"));
			RecipeStoreBasketDTO dto = new RecipeStoreBasketDTO();
			dto.setId(id);
			dto.setSnum(snum);
			dto.setAmount(amount);
			dao.insert(dto);
			PrintWriter out = response.getWriter();
			out.write(1+"");
		}else if(uri.indexOf("list.do") != -1) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			List<RecipeStoreBasketDTO> list = dao.list(id);
			page = "/recipe/recipeStoreBasket/list.jsp";
			request.setAttribute("list", list);
			request.setAttribute("count", dao.count(id));
			System.out.println(dao.count(id));
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("delete.do") != -1) {
			String[] check = request.getParameterValues("check");
			for(int i = 0; i < check.length; i++) {
				int bnum = Integer.parseInt(check[i]);
				dao.delete(bnum);
			}
			page += "/recipeStoreBasket_servlet/list.do";
			response.sendRedirect(page);
		}else if(uri.indexOf("update.do") != -1) {
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			int amount = Integer.parseInt(request.getParameter("amount"));
			dao.update(bnum, amount);
		}else if(uri.indexOf("buy.do") != -1) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			String[] check = request.getParameterValues("check");
			List<RecipeStoreBasketDTO> list = new ArrayList<>();
			int moneyAll = 0;
			for(int i = 0; i < check.length; i++) {
				int bnum = Integer.parseInt(check[i]);
				RecipeStoreBasketDTO dto = new RecipeStoreBasketDTO();
				dto = dao.view(bnum);
				moneyAll += dto.getMoney();
				list.add(dto);
			}
			RecipeMemberDAO memberDao = new RecipeMemberDAO();
			RecipeMemberAddressDAO addressDao = new RecipeMemberAddressDAO();
			page = "/recipe/recipeStoreBasket/buy.jsp";
			request.setAttribute("list", list);
			request.setAttribute("moneyAll", moneyAll);
			request.setAttribute("point", memberDao.view(id).getPoint());
			request.setAttribute("default_address", addressDao.default_address(id));
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
