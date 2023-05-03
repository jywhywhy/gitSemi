package recipe.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.internal.build.AllowSysOut;

import recipe.dao.RecipeMemberDAO;
import recipe.dto.RecipeMemberDTO;

@WebServlet("/recipeMember_servlet/*")
public class RecipeMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String page = path;
		RecipeMemberDAO dao = new RecipeMemberDAO();
		if(uri.indexOf("insert.do") != -1) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			Date birth_date = Date.valueOf(request.getParameter("birth_date"));
			RecipeMemberDTO dto = new RecipeMemberDTO();
			dto.setId(id);
			dto.setName(name);
			dto.setPassword(password);
			dto.setBirth_date(birth_date);
			dao.insert(dto);
			page += "/recipe/index.jsp";
			response.sendRedirect(page);
		}else if(uri.indexOf("idCheck.do") != -1) {
			String id = request.getParameter("id");
			int result = dao.idCheck(id);
			request.setAttribute("result", result);
			PrintWriter out = response.getWriter();
			out.write(result+"");
		}else if(uri.indexOf("login.do") != -1) {
			HttpSession session = request.getSession();
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			RecipeMemberDTO dto = new RecipeMemberDTO();
			dto = dao.login(id, password);
			PrintWriter out = response.getWriter();
			if(dto != null) {
				if(dto.getShow().equals("N")) {
					out.write('2');
				}else {
					session.setAttribute("id", dto.getId());
					session.setAttribute("name", dto.getName());
					session.setAttribute("admin", dto.getAdmin());
					session.setAttribute("admin2", dto.getAdmin2());
					page = "/recipe/index.jsp";
					out.write('1');
				}
			}else {
				out.write('0');
			}
		}else if(uri.indexOf("logout.do") != -1) {
			HttpSession session = request.getSession();
			session.invalidate();
			page += "/recipe/index.jsp";
			response.sendRedirect(page);
		}else if(uri.indexOf("view.do") != -1) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			RecipeMemberDTO dto = new RecipeMemberDTO();
			dto = dao.view(id);
			request.setAttribute("dto", dto);
			page = "/recipe/recipeMember/view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("passwordUpdate.do") != -1) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			String password = request.getParameter("updatePassword");
			RecipeMemberDTO dto = new RecipeMemberDTO();
			dto.setId(id);
			dto.setPassword(password);
			dao.updatePassword(dto);
			page += "/recipeMember_servlet/view.do";
			response.sendRedirect(page);
		}else if(uri.indexOf("update.do") != -1) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			String name = request.getParameter("name");
			Date birth_date = Date.valueOf(request.getParameter("birth_date"));
			RecipeMemberDTO dto = new RecipeMemberDTO();
			dto.setId(id);
			dto.setName(name);
			dto.setBirth_date(birth_date);
			dao.update(dto);
			session.setAttribute("name", name);
			page += "/recipe/index.jsp";
			response.sendRedirect(page);
		}else if(uri.indexOf("memberList.do") != -1) {
			RecipeMemberDTO dto = new RecipeMemberDTO();
			List<RecipeMemberDTO> list = dao.memberList();
			request.setAttribute("list", list);
			page = "/recipe/recipeMember/memberList.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("memberInfo.do") != -1) {
			String id = request.getParameter("id");
			RecipeMemberDTO dto = new RecipeMemberDTO();
			dto = dao.view(id);
			page = "/recipe/recipeMember/memberInfo.jsp";
			request.setAttribute("dto", dto);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("search.do") != -1) {
			String search = request.getParameter("search");
			search = "%"+search+"%";
			RecipeMemberDTO dto = new RecipeMemberDTO();
			List<RecipeMemberDTO> list = dao.search(search);
			page = "/recipe/recipeMember/search.jsp";
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("out.do") != -1) {
			String id = request.getParameter("id");
			dao.out(id);
			page += "/recipeMember_servlet/memberList.do";
			response.sendRedirect(page);
		}else if(uri.indexOf("in.do") != -1) {
			String id = request.getParameter("id");
			dao.in(id);
			page += "/recipeMember_servlet/memberList.do";
			response.sendRedirect(page);
		}else if(uri.indexOf("grant.do") != -1) {
			String id = request.getParameter("id");
			dao.grant(id);
			page += "/recipeMember_servlet/memberList.do";
			response.sendRedirect(page);
		}else if(uri.indexOf("revoke.do") != -1) {
			String id = request.getParameter("id");
			dao.revoke(id);
			page += "/recipeMember_servlet/memberList.do";
			response.sendRedirect(page);
		}else if(uri.indexOf("delete.do") != -1) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			dao.out(id);
			session.invalidate();
			page += "/recipe/index.jsp";
			response.sendRedirect(page);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
}
