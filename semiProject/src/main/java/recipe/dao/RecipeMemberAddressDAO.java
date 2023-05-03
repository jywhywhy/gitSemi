package recipe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import recipe.dto.RecipeMemberAddressDTO;
import sqlmap.MybatisManager;

public class RecipeMemberAddressDAO {

	public List<RecipeMemberAddressDTO> addressList(String id) {
		SqlSession session = null;
		List<RecipeMemberAddressDTO> list = null;
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("recipeMemberAddress.addressList", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public void updateY(int anum) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("recipeMemberAddress.updateY", anum);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public void updateN(int anum, String id) {
		SqlSession session = null;
		Map<String, Object> map = null;
		try {
			session = MybatisManager.getInstance().openSession();
			map = new HashMap<>();
			map.put("anum", anum);
			map.put("id", id);
			session.update("recipeMemberAddress.updateN", map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public void write(RecipeMemberAddressDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("recipeMemberAddress.write", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public int count(String id) {
		SqlSession session = null;
		int result = 0;
		try {
			session = MybatisManager.getInstance().openSession();
			result = session.selectOne("recipeMemberAddress.count", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}

	public RecipeMemberAddressDTO default_address(String id) {
		SqlSession session = null;
		RecipeMemberAddressDTO dto = null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("recipeMemberAddress.default_address", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}

	public void delete(int anum) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("recipeMemberAddress.delete", anum);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public int default_anum(String id) {
		SqlSession session = null;
		int result = 0;
		try {
			session = MybatisManager.getInstance().openSession();
			result = session.selectOne("recipeMemberAddress.default_anum", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}
	
}
