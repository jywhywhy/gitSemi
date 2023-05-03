package recipe.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import page.Pager;
import recipe.dao.RecipeBoardDAO;
import recipe.dao.RecipeBoardGoodDAO;
import recipe.dao.RecipeMemberDAO;
import recipe.dto.RecipeBoardDTO;
import recipe.dto.RecipeMemberDTO;

@WebServlet("/recipeBoard_servlet/*")
public class RecipeBoardControllor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String page = path;
		RecipeBoardDAO dao = new RecipeBoardDAO();
		if(uri.indexOf("list.do") != -1) {
			String search = request.getParameter("search");
			request.setAttribute("search", search);
			int count = 0;
			if(search == "" || search == null) {
				search = "%";
			}else {
				search = "%"+search+"%";
			}
			count = dao.count(search);
			int curPage = 1;
			if(request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			List<RecipeBoardDTO> list = dao.list(start, end, search);
			request.setAttribute("page", pager);
			request.setAttribute("list", list);
			page = "/recipe/recipeBoard/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("write.do") != -1) {
			HttpSession session = request.getSession();
			String path2 = "C:\\work_java\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\semiProject\\recipe\\img\\";
			File uploadDir = new File(path2);
			if(!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			MultipartRequest multi = new MultipartRequest(request, path2, (10*1024*1024), "utf-8", new DefaultFileRenamePolicy());
			String filename = "-";
			try {
				Enumeration files = multi.getFileNames();
				while(files.hasMoreElements()) {
					String file = (String)files.nextElement();
					if(multi.getFilesystemName(file) != null) {
						filename = multi.getFilesystemName(file);
						File f = multi.getFile(file);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			String id = (String)session.getAttribute("id");
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			RecipeBoardDTO dto = new RecipeBoardDTO();
			dto.setId(id);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setFilename(filename);
			dao.write(dto);
			page += "/recipeBoard_servlet/list.do?search=";
			response.sendRedirect(page);
		}else if(uri.indexOf("viewContent.do") != -1) {
			HttpSession session = request.getSession();
			int num = Integer.parseInt(request.getParameter("num"));
			String viewUp = "";
			if(request.getParameter("viewUp") != null) {
				viewUp = request.getParameter("viewUp");
			}else {
				viewUp = "N";
			}
			RecipeBoardDTO dto = new RecipeBoardDTO();
			dto = dao.viewContent(num);
			request.setAttribute("dto", dto);
			if(dto.getShow().equals("Y")) {
				dao.updateRead_count(num, session);
			}else {
				if(viewUp.equals("Y")) {
					request.setAttribute("viewUp", viewUp);
				}
				request.setAttribute("message", "noShow");
			}
			page = "/recipe/recipeBoard/viewContent.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);			
		}else if(uri.indexOf("update.do") != -1) {
			String path2 = "C:\\work_java\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\semiProject\\recipe\\img\\";
			File uploadDir = new File(path2);
			if(!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			MultipartRequest multi = new MultipartRequest(request, path2, (10*1024*1024), "utf-8", new DefaultFileRenamePolicy());
			int num = Integer.parseInt(multi.getParameter("num"));
			RecipeBoardDTO dto = new RecipeBoardDTO();
			dto = dao.viewContent(num);
			String filename = dto.getFilename();
			try {
				Enumeration files = multi.getFileNames();
				while(files.hasMoreElements()) {
					String file = (String)files.nextElement();
					if(multi.getFilesystemName(file) != null) {
						filename = multi.getFilesystemName(file);
						File f = multi.getFile(file);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			dto.setNum(num);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setFilename(filename);
			dao.update(dto);
			page += "/recipeBoard_servlet/viewContent.do?num="+num;
			response.sendRedirect(page);
		}else if(uri.indexOf("delete.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			dao.updateShow(num);
			page += "/recipeBoard_servlet/list.do?search=";
			response.sendRedirect(page);
		}else if(uri.indexOf("reWrite.do") != -1) {
			HttpSession session = request.getSession();
			String path2 = "C:\\work_java\\\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\semiProject\\recipe\\img\\";
			File uploadDir = new File(path2);
			if(!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			MultipartRequest multi = new MultipartRequest(request, path2, (10*1024*1024), "utf-8", new DefaultFileRenamePolicy());
			String filename = "-";
			try {
				Enumeration files = multi.getFileNames();
				while(files.hasMoreElements()) {
					String file = (String)files.nextElement();
					if(multi.getFilesystemName(file) != null) {
						filename = multi.getFilesystemName(file);
						File f = multi.getFile(file);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			int num = Integer.parseInt(multi.getParameter("num"));
			String id = (String)session.getAttribute("id");
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			RecipeBoardDTO dto = new RecipeBoardDTO();
			dto = dao.viewContent(num);
			dto.setParent_num(num);
			int ref = dto.getRef();
			int re_step = dto.getRe_step()+1;
			int re_level = dto.getRe_level()+1;
			dto.setId(id);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setRef(ref);
			dto.setRe_step(re_step);
			dto.setRe_level(re_level);
			dto.setFilename(filename);
			dao.updateStep(ref, re_step);
			dao.reWrite(dto);
			page += "/recipeBoard_servlet/list.do?search=";
			response.sendRedirect(page);
		}else if(uri.indexOf("view.do") != -1) {
			String id = request.getParameter("id");
			request.setAttribute("id", id);
			int count = 0;
			count = dao.viewCount(id);
			request.setAttribute("count", count);
			RecipeMemberDAO memberDao = new RecipeMemberDAO();
			RecipeMemberDTO memberDto = new RecipeMemberDTO();
			memberDto = memberDao.view(id);
			request.setAttribute("reg_date", memberDto.getReg_date());
			int curPage = 1;
			if(request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			List<RecipeBoardDTO> list = dao.view(start, end, id);
			request.setAttribute("page", pager);
			request.setAttribute("list", list);
			page = "/recipe/recipeBoard/view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("viewUp.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			RecipeBoardDTO dto = new RecipeBoardDTO();
			dto = dao.viewContent(num);
			int parent_num = dto.getParent_num();
			page += "/recipeBoard_servlet/viewContent.do?num="+parent_num+"&viewUp=Y";
			response.sendRedirect(page);
		}else if(uri.indexOf("good.do") != -1) {
			HttpSession session = request.getSession();
			int num = Integer.parseInt(request.getParameter("num"));
			dao.good(num);
			String id = (String)session.getAttribute("id");
			RecipeBoardGoodDAO goodDao = new RecipeBoardGoodDAO();
			goodDao.insert(id, num);
			RecipeBoardDTO dto = new RecipeBoardDTO();
			dto = dao.viewContent(num);
			RecipeMemberDAO memberDao = new RecipeMemberDAO();
			memberDao.upPoint(dto.getId());
			PrintWriter out = response.getWriter();
			out.write(dto.getGood()+"");
		}else if(uri.indexOf("noGood.do") != -1) {
			HttpSession session = request.getSession();
			int num = Integer.parseInt(request.getParameter("num"));
			dao.noGood(num);
			String id = (String)session.getAttribute("id");
			RecipeBoardGoodDAO goodDao = new RecipeBoardGoodDAO();
			goodDao.delete(id, num);
			RecipeBoardDTO dto = new RecipeBoardDTO();
			dto = dao.viewContent(num);
			RecipeMemberDAO memberDao = new RecipeMemberDAO();
			if(memberDao.view(dto.getId()).getPoint() > 0) {
				memberDao.downPoint(dto.getId());
			}
			PrintWriter out = response.getWriter();
			out.write(dto.getGood()+"");
		}else if(uri.indexOf("goodList.do") != -1) {
			String id = request.getParameter("id");
			int count = 0;
			count = dao.goodCount(id);
			int curPage = 1;
			if(request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			List<RecipeBoardDTO> list = dao.goodList(start, end, id);
			request.setAttribute("page", pager);
			request.setAttribute("list", list);
			request.setAttribute("id", id);
			page = "/recipe/recipeBoardGood/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("img.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			RecipeBoardDTO dto = new RecipeBoardDTO();
			dto = dao.viewContent(num);
			if(!dto.getFilename().equals("-")) {
				ServletOutputStream out = response.getOutputStream();
				String path2 = "C:\\work_java\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\semiProject\\recipe\\img\\" + dto.getFilename();
				FileInputStream in = new FileInputStream(path2);
				while(true) {
					int readByte = in.read();
					if(readByte == -1) break;
					out.write(readByte);
				}
				in.close();
			}
		}else if(uri.indexOf("writeNotice.do") != -1) {
			HttpSession session = request.getSession();
			String path2 = "C:\\work_java\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\semiProject\\recipe\\img\\";
			File uploadDir = new File(path2);
			if(!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			MultipartRequest multi = new MultipartRequest(request, path2, (10*1024*1024), "utf-8", new DefaultFileRenamePolicy());
			String filename = "-";
			try {
				Enumeration files = multi.getFileNames();
				while(files.hasMoreElements()) {
					String file = (String)files.nextElement();
					if(multi.getFilesystemName(file) != null) {
						filename = multi.getFilesystemName(file);
						File f = multi.getFile(file);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			String id = (String)session.getAttribute("id");
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			RecipeBoardDTO dto = new RecipeBoardDTO();
			dto.setId(id);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setFilename(filename);
			dao.writeNotice(dto);
			page += "/recipeBoard_servlet/list.do?search=";
			response.sendRedirect(page);
		}else if(uri.indexOf("noticeList.do") != -1) {
			int count = 0;
			count = dao.noticeCount();
			int curPage = 1;
			if(request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			List<RecipeBoardDTO> list = dao.noticeList(start, end);
			request.setAttribute("page", pager);
			request.setAttribute("list", list);
			page = "/recipe/recipeBoard/noticeList.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("bestGood.do") != -1) {
			RecipeBoardDTO dto = new RecipeBoardDTO();
			dto = dao.bestGood();
			if(dto != null) {
				page = "/recipe/recipeBoard/bestGood.jsp";
				request.setAttribute("dto", dto);
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		}else if(uri.indexOf("bestRead_count.do") != -1) {
			RecipeBoardDTO dto = new RecipeBoardDTO();
			dto = dao.bestRead_count();
			if(dto != null) {
				page = "/recipe/recipeBoard/bestRead_count.jsp";
				request.setAttribute("dto", dto);
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		}else if(uri.indexOf("bestMember.do") != -1) {
			String id = dao.bestMember();
			if(id != null) {
				page = "/recipe/recipeBoard/bestMember.jsp";
				request.setAttribute("id", id);
				System.out.println(id);
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		}else if(uri.indexOf("checkDelete.do") != -1) {
			String[] check = request.getParameterValues("check");
			for(int i = 0; i < check.length; i++) {
				int num = Integer.parseInt(check[i]);
				dao.updateShow(num);
			}
			page += "/recipeBoard_servlet/list.do?search=";
			response.sendRedirect(page);
		}else if(uri.indexOf("checkNoticeDelete.do") != -1) {
			String[] check = request.getParameterValues("check");
			for(int i = 0; i < check.length; i++) {
				int num = Integer.parseInt(check[i]);
				dao.updateShow(num);
			}
			page += "/recipeBoard_servlet/noticeList.do";
			response.sendRedirect(page);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
}
