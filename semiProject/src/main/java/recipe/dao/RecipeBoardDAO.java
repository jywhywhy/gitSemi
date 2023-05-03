package recipe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import recipe.dto.RecipeBoardDTO;
import sqlmap.MybatisManager;

public class RecipeBoardDAO {
	public List<RecipeBoardDTO> list(int start, int end, String search){
		SqlSession session = null;
		List<RecipeBoardDTO> list = null;
		Map<String, Object> map = null;
		try {
			session = MybatisManager.getInstance().openSession();
			map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("search", search);
			list = session.selectList("recipeBoard.list", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public RecipeBoardDTO viewContent(int num) {
		SqlSession session = null;
		RecipeBoardDTO dto = null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = new RecipeBoardDTO();
			dto = session.selectOne("recipeBoard.viewContent", num);
			String content = dto.getContent();
			content = content.replace("\n", "<br>");
			dto.setContent(content);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}

	public int count(String search) {
		SqlSession session = null;
		int result = 0;
		try {
			session = MybatisManager.getInstance().openSession();
			result = session.selectOne("recipeBoard.count", search);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result+3;
	}

	public void write(RecipeBoardDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("recipeBoard.write", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public List<RecipeBoardDTO> searchList(String search) {
		SqlSession session = null;
		List<RecipeBoardDTO> list = null;
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("recipeBoard.searchList", search);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public void update(RecipeBoardDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("recipeBoard.update", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public void reWrite(RecipeBoardDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("recipeBoard.reWrite", dto);
			session.commit();
			System.out.println(dto.getNum());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}

	public void updateRead_count(int num, HttpSession countSession) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			long time = 0;
			if(countSession.getAttribute("time_"+num) != null) {
				time = (long)countSession.getAttribute("time_"+num);
			}
			long now = System.currentTimeMillis();
			if(now-time > 24*60*60*1000) {
				session.update("recipeBoard.updateRead_count", num);
				session.commit();
				countSession.setAttribute("time_"+num, now);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public List<RecipeBoardDTO> view(int start, int end, String id) {
		SqlSession session = null;
		List<RecipeBoardDTO> list = null;
		Map<String, Object> map = null;
		try {
			session = MybatisManager.getInstance().openSession();
			map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("id", id);
			list = session.selectList("recipeBoard.view", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public int viewCount(String id) {
		SqlSession session = null;
		int result = 0;
		try {
			session = MybatisManager.getInstance().openSession();
			result = session.selectOne("recipeBoard.viewCount", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}

	public void updateStep(int ref, int re_step) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			RecipeBoardDTO dto = new RecipeBoardDTO();
			dto.setRef(ref);
			dto.setRe_step(re_step);
			session.update("recipeBoard.updateStep", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}

	public void updateShow(int num) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("recipeBoard.updateShow", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public void good(int num) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("recipeBoard.good", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public void noGood(int num) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("recipeBoard.noGood", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public List<RecipeBoardDTO> goodList(int start, int end, String id) {
		SqlSession session = null;
		List<RecipeBoardDTO> list = null;
		Map<String, Object> map = null;
		try {
			session = MybatisManager.getInstance().openSession();
			map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("id", id);
			list = session.selectList("recipeBoard.goodList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public int goodCount(String id) {
		SqlSession session = null;
		int result = 0;
		try {
			session = MybatisManager.getInstance().openSession();
			result = session.selectOne("recipeBoard.goodCount", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}

	public void writeNotice(RecipeBoardDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("recipeBoard.writeNotice", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public List<RecipeBoardDTO> noticeList(int start, int end) {
		SqlSession session = null;
		List<RecipeBoardDTO> list = null;
		Map<String, Object> map = null;
		try {
			session = MybatisManager.getInstance().openSession();
			map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list = session.selectList("recipeBoard.noticeList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public int noticeCount() {
		SqlSession session = null;
		int result = 0;
		try {
			session = MybatisManager.getInstance().openSession();
			result = session.selectOne("recipeBoard.noticeCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}

	public RecipeBoardDTO bestGood() {
		SqlSession session = null;
		RecipeBoardDTO dto = null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("recipeBoard.bestGood");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}

	public RecipeBoardDTO bestRead_count() {
		SqlSession session = null;
		RecipeBoardDTO dto = null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("recipeBoard.bestRead_count");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}

	public String bestMember() {
		SqlSession session = null;
		String id = "";
		try {
			session = MybatisManager.getInstance().openSession();
			id = session.selectOne("recipeBoard.bestMember");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return id;
	}


}
