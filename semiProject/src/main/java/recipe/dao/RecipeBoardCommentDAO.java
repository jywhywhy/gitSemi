package recipe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import recipe.dto.RecipeBoardCommentDTO;
import sqlmap.MybatisManager;

public class RecipeBoardCommentDAO {

	public List<RecipeBoardCommentDTO> list(int num) {
		SqlSession session = null;
		List<RecipeBoardCommentDTO> list = null;
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("recipeBoardComment.list", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public void update(RecipeBoardCommentDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("recipeBoardComment.update", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public void insert(RecipeBoardCommentDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("recipeBoardComment.insert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}

	public RecipeBoardCommentDTO view(int comment_num) {
		SqlSession session = null;
		RecipeBoardCommentDTO dto = null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("recipeBoardComment.view", comment_num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}

	public void insertComment(RecipeBoardCommentDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("recipeBoardComment.insertComment", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	
	public void updateStep(int ref, int re_step) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			RecipeBoardCommentDTO dto = new RecipeBoardCommentDTO();
			dto.setRef(ref);
			dto.setRe_step(re_step);
			session.update("recipeBoardComment.updateStep", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public void updateShow(int comment_num) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("recipeBoardComment.updateShow", comment_num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

}
