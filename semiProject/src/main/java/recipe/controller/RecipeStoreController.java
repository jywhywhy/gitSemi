package recipe.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import page.StorePager;
import recipe.dao.RecipeStoreDAO;
import recipe.dto.RecipeStoreDTO;

@WebServlet("/recipeStore_servlet/*")
public class RecipeStoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String page = path;
		RecipeStoreDAO dao = new RecipeStoreDAO();
		if(uri.indexOf("list.do") != -1) {
			int count = 0;
			count = dao.count();
			int curPage = 1;
			if(request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			StorePager pager = new StorePager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			List<RecipeStoreDTO> list = dao.list(start, end);
			request.setAttribute("page", pager);
			request.setAttribute("list", list);
			request.setAttribute("count", dao.count());
			page = "/recipe/recipeStore/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("img.do") != -1) {
			int snum = Integer.parseInt(request.getParameter("snum"));
			RecipeStoreDTO dto = new RecipeStoreDTO();
			dto = dao.view(snum);
			if(!dto.getPicture().equals("-")) {
				ServletOutputStream out = response.getOutputStream();
				String path2 = "C:\\work_java\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\semiProject\\recipe\\img\\" + dto.getPicture();
				FileInputStream in = new FileInputStream(path2);
				while(true) {
					int readByte = in.read();
					if(readByte == -1) break;
					out.write(readByte);
				}
				in.close();
			}
		}else if(uri.indexOf("write.do") != -1) {
			String path2 = "C:\\work_java\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\semiProject\\recipe\\img\\";
			File uploadDir = new File(path2);
			if(!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			MultipartRequest multi = new MultipartRequest(request, path2, (10*1024*1024), "utf-8", new DefaultFileRenamePolicy());
			String picture = "-";
			try {
				Enumeration files = multi.getFileNames();
				while(files.hasMoreElements()) {
					String file = (String)files.nextElement();
					if(multi.getFilesystemName(file) != null) {
						picture = multi.getFilesystemName(file);
						File f = multi.getFile(file);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			String sname = multi.getParameter("sname");
			int price = Integer.parseInt(multi.getParameter("price"));
			String description = multi.getParameter("description");
			RecipeStoreDTO dto = new RecipeStoreDTO();
			dto.setSname(sname);
			dto.setPrice(price);
			dto.setDescription(description);
			dto.setPicture(picture);
			dao.write(dto);
			page += "/recipeStore_servlet/list.do";
			response.sendRedirect(page);
		}else if(uri.indexOf("view.do") != -1) {
			int snum = Integer.parseInt(request.getParameter("snum"));
			RecipeStoreDTO dto = new RecipeStoreDTO();
			dto = dao.view(snum);
			page = "/recipe/recipeStore/view.jsp";
			request.setAttribute("dto", dto);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("delete.do") != -1) {
			int snum = Integer.parseInt(request.getParameter("snum"));
			dao.delete(snum);
			page += "/recipeStore_servlet/list.do";
			response.sendRedirect(page);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
