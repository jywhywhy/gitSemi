package recipe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import recipe.dto.RecipeMessageDTO;
import sqlmap.MybatisManager;

public class RecipeMessageDAO {

	public void write(RecipeMessageDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("recipeMessage.write", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public List<RecipeMessageDTO> list(int start, int end, String receiver) {
		SqlSession session = null;
		List<RecipeMessageDTO> list = null;
		Map<String, Object> map = null;
		try {
			session = MybatisManager.getInstance().openSession();
			map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("receiver", receiver);
			list = session.selectList("recipeMessage.list", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public void read(int mnum) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("recipeMessage.read", mnum);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public void delete(int mnum) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.delete("recipeMessage.delete", mnum);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public int count(String receiver) {
		SqlSession session = null;
		int result = 0;
		try {
			session = MybatisManager.getInstance().openSession();
			result = session.selectOne("recipeMessage.count", receiver);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}

	public int newMessage(String receiver) {
		SqlSession session = null;
		int result = 0;
		try {
			session = MybatisManager.getInstance().openSession();
			result = session.selectOne("recipeMessage.newMessage", receiver);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}

}
