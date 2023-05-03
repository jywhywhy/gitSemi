package recipe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import recipe.dto.RecipeStoreBasketDTO;
import sqlmap.MybatisManager;

public class RecipeStoreBasketDAO {

	public void insert(RecipeStoreBasketDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("recipeStoreBasket.insert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public List<RecipeStoreBasketDTO> list(String id) {
		SqlSession session = null;
		List<RecipeStoreBasketDTO> list = null;
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("recipeStoreBasket.list", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public void delete(int bnum) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.delete("recipeStoreBasket.delete", bnum);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public void update(int bnum, int amount) {
		SqlSession session = null;
		Map<String, Object> map = null;
		try {
			session = MybatisManager.getInstance().openSession();
			map = new HashMap<>();
			map.put("bnum", bnum);
			map.put("amount", amount);
			session.update("recipeStoreBasket.update", map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.clearCache();
		}
	}

	public RecipeStoreBasketDTO view(int bnum) {
		SqlSession session = null;
		RecipeStoreBasketDTO dto = null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("recipeStoreBasket.view", bnum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.commit();
		}
		return dto;
	}

	public void updateShow(int bnum) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("recipeStoreBasket.updateShow", bnum);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.commit();
		}
	}

	public int count(String id) {
		SqlSession session = null;
		int result = 0;
		try {
			session = MybatisManager.getInstance().openSession();
			result = session.selectOne("recipeStoreBasket.count", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.commit();
		}
		return result;
	}
}
