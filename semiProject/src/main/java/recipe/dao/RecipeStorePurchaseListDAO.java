package recipe.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import recipe.dto.RecipeStorePurchaseListDTO;
import sqlmap.MybatisManager;

public class RecipeStorePurchaseListDAO {

	public int firstWrite(RecipeStorePurchaseListDTO dto) {
		SqlSession session = null;
		int order_num = 0;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("recipeStorePurchaseList.firstWrite", dto);
			order_num = dto.getOrder_num();
			System.out.println(order_num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return order_num;
	}

	public void write(RecipeStorePurchaseListDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("recipeStorePurchaseList.write", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public List<RecipeStorePurchaseListDTO> list(String id) {
		SqlSession session = null;
		List<RecipeStorePurchaseListDTO> list = null;
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("recipeStorePurchaseList.list", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public List<RecipeStorePurchaseListDTO> view(int order_num) {
		SqlSession session = null;
		List<RecipeStorePurchaseListDTO> list = null;
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("recipeStorePurchaseList.view", order_num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
		
	}

	public int moneyAll(int order_num) {
		SqlSession session = null;
		RecipeStorePurchaseListDTO dto = null;
		int result = 0;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("recipeStorePurchaseList.moneyAll", order_num);
			result = dto.getMoneyAll();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}

}
