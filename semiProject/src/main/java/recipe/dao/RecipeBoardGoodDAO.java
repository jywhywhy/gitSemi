package recipe.dao;

import org.apache.ibatis.session.SqlSession;

import recipe.dto.RecipeBoardGoodDTO;
import sqlmap.MybatisManager;

public class RecipeBoardGoodDAO {

	public void insert(String id, int num) {
		SqlSession session = null;
		RecipeBoardGoodDTO dto = null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = new RecipeBoardGoodDTO(id, num);
			session.insert("recipeBoardGood.insert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public int goodCheck(RecipeBoardGoodDTO dto) {
		System.out.println(dto.getId());
		System.out.println(dto.getNum());
		SqlSession session = null;
		int result = 0;
		try {
			session = MybatisManager.getInstance().openSession();
			result = session.selectOne("recipeBoardGood.goodCheck", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}

	public void delete(String id, int num) {
		SqlSession session = null;
		RecipeBoardGoodDTO dto = null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = new RecipeBoardGoodDTO(id, num);
			session.delete("recipeBoardGood.delete", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	
}
