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

import recipe.dao.RecipeMemberAddressDAO;
import recipe.dto.RecipeMemberAddressDTO;

@WebServlet("/recipeMemberAddress_servlet/*")
public class RecipeMemberAddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String page = path;
		RecipeMemberAddressDAO dao = new RecipeMemberAddressDAO();
		if(uri.indexOf("addressList.do") != -1) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			List<RecipeMemberAddressDTO> list = dao.addressList(id); 
			page = "/recipe/recipeMemberAddress/addressList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("count", dao.count(id));
			System.out.println(dao.count(id));
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("update.do") != -1) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			int anum = Integer.parseInt(request.getParameter("anum"));
			System.out.println(anum);
			dao.updateY(anum);
			dao.updateN(anum, id);
		}else if(uri.indexOf("write.do") != -1) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			int count = dao.count(id);
			PrintWriter out = response.getWriter();
			if(count >= 3) {
				out.write("full");
			}else {
				String aname = request.getParameter("aname");
				String zipcode = request.getParameter("zipcode");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				System.out.println(address2);
				RecipeMemberAddressDTO dto = new RecipeMemberAddressDTO();
				dto.setId(id);
				dto.setAname(aname);
				dto.setZipcode(zipcode);
				dto.setAddress1(address1);
				dto.setAddress2(address2);
				dao.write(dto);
			}
		}else if(uri.indexOf("default_address.do") != -1) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			RecipeMemberAddressDTO dto = new RecipeMemberAddressDTO();
			dto = dao.default_address(id);
			page = "/recipe/recipeMemberAddress/default_address.jsp";
			request.setAttribute("dto", dto);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("delete") != -1) {
			int anum = Integer.parseInt(request.getParameter("anum"));
			dao.delete(anum);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
