package recipe.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recipe.dao.RecipeMemberAddressDAO;
import recipe.dao.RecipeMemberDAO;
import recipe.dao.RecipeStoreBasketDAO;
import recipe.dao.RecipeStorePurchaseListDAO;
import recipe.dto.RecipeStorePurchaseListDTO;

@WebServlet("/recipeStorePurchaseList_servlet/*")
public class RecipeStorePurchaseListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String page = path;
		RecipeStorePurchaseListDAO dao = new RecipeStorePurchaseListDAO();
		if(uri.indexOf("write.do") != -1) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			int point = Integer.parseInt(request.getParameter("point"));
			String[] bnums = request.getParameterValues("bnum");
			int bnum = Integer.parseInt(bnums[0]);
			RecipeMemberAddressDAO addressDao = new RecipeMemberAddressDAO();
			int anum = addressDao.default_anum(id);
			RecipeStorePurchaseListDTO dto = new RecipeStorePurchaseListDTO();
			dto.setId(id);
			dto.setBnum(bnum);
			dto.setAnum(anum);
			dto.setId(id);
			dto.setOrder_date(new Date());
			int order_num = dao.firstWrite(dto);
			for(int i = 1; i < bnums.length; i++) {
				dto.setOrder_num(order_num);
				bnum = Integer.parseInt(bnums[i]);
				dto.setBnum(bnum);
				dao.write(dto);
			}
			RecipeStoreBasketDAO basketDao = new RecipeStoreBasketDAO();
			for(int i = 0; i <bnums.length; i++) {
				bnum = Integer.parseInt(bnums[i]);
				basketDao.updateShow(bnum);
			}
			new RecipeMemberDAO().point(id, point);
			page += "/recipeStorePurchaseList_servlet/list.do";
			response.sendRedirect(page);
		}else if(uri.indexOf("list.do") != -1) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			List<RecipeStorePurchaseListDTO> list = dao.list(id);
			page = "/recipe/recipeStorePurchaseList/list.jsp";
			request.setAttribute("list", list);
			request.setAttribute("count", list.size());
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("view.do") != -1) {
			int order_num = Integer.parseInt(request.getParameter("order_num"));
			List<RecipeStorePurchaseListDTO> list = dao.view(order_num);
			int moneyAll = dao.moneyAll(order_num);
			page = "/recipe/recipeStorePurchaseList/view.jsp";
			request.setAttribute("address", list.get(0).getAddress1()+" "+list.get(0).getAddress2()+" ("+list.get(0).getZipcode()+")");
			request.setAttribute("list", list);
			request.setAttribute("moneyAll", moneyAll);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
