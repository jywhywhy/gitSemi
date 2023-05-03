package recipe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import crypt.BCrypt;
import recipe.dto.RecipeMemberDTO;
import sqlmap.MybatisManager;

public class RecipeMemberDAO {

	public void insert(RecipeMemberDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto.setPassword(BCrypt.hashpw(dto.getPassword(), BCrypt.gensalt()));
			session.insert("recipeMember.insert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public int idCheck(String id) {
		SqlSession session = null;
		int result = 0;
		try {
			session = MybatisManager.getInstance().openSession();
			result = session.selectOne("recipeMember.idCheck", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}

	public RecipeMemberDTO login(String id, String password) {
		SqlSession session = null;
		RecipeMemberDTO dto = null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("recipeMember.login", id);
			if(dto != null) {
				if(!BCrypt.checkpw(password, dto.getPassword())) {
					dto = null;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}

	public RecipeMemberDTO view(String id) {
		SqlSession session = null;
		RecipeMemberDTO dto = null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("recipeMember.view", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}

	public void updatePassword(RecipeMemberDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto.setPassword(BCrypt.hashpw(dto.getPassword(), BCrypt.gensalt()));
			session.update("recipeMember.updatePassword", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public void update(RecipeMemberDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("recipeMember.update", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public List<RecipeMemberDTO> memberList() {
		SqlSession session = null;
		List<RecipeMemberDTO> list = null;
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("recipeMember.memberList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public List<RecipeMemberDTO> search(String search) {
		SqlSession session = null;
		List<RecipeMemberDTO> list = null;
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("recipeMember.search", search);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public void out(String id) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("recipeMember.out", id);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public void in(String id) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("recipeMember.in", id);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public void grant(String id) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("recipeMember.grant", id);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public void revoke(String id) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("recipeMember.revoke", id);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public void upPoint(String id) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("recipeMember.upPoint", id);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public void downPoint(String id) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("recipeMember.downPoint", id);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public void point(String id, int point) {
		SqlSession session = null;
		Map<String, Object> map = null;
		try {
			session = MybatisManager.getInstance().openSession();
			map = new HashMap<>();
			map.put("id", id);
			map.put("point", point);
			session.update("recipeMember.point", map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
}
