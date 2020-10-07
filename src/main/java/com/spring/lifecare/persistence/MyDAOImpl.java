package com.spring.lifecare.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.lifecare.vo.BoardVO;
import com.spring.lifecare.vo.medicalVO;


@Repository
public class MyDAOImpl implements MyDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	//게시글 갯수 구하기
	@Override
	public int getArticleCnt() {
		MyDAO dao = sqlSession.getMapper(MyDAO.class);
		return dao.getArticleCnt();
	}
	
	//게시물 목록 조회
	@Override
	public List<BoardVO> getArticleList(Map<String, Object> map) {
		List<BoardVO> dtos = null;
		MyDAO dao = sqlSession.getMapper(MyDAO.class);
		dtos = dao.getArticleList(map);
		return dtos;
	}

	//상세페이지 조회(한건의 정보)
	@Override
	public BoardVO getArticle(Map<String, Object> map) {
		MyDAO dao = sqlSession.getMapper(MyDAO.class);
		return dao.getArticle(map);
	}
	
	//수정페이지 조회(한건의 정보)
	@Override
	public BoardVO modifyArticle(int board_sortnum) {
		MyDAO dao = sqlSession.getMapper(MyDAO.class);
		return dao.modifyArticle(board_sortnum);
	}

	//비밀번호 인증
	@Override
	public String numPwdCheck(String customer_id) {
		MyDAO dao = sqlSession.getMapper(MyDAO.class);
		return dao.numPwdCheck(customer_id);
	}
	
	//게시글 수정 처리
	@Override
	public int updateContent(BoardVO vo) {
		return sqlSession.update("com.spring.lifecare.persistence.MyDAO.updateContent", vo);
	}

	//유저 글쓰기
	@Override
	public int newWrite() {
		return sqlSession.selectOne("com.spring.lifecare.persistence.MyDAO.newWrite");
	}
	
	//글쓰기 처리
	@Override
	public int writeContent(BoardVO vo) {
		MyDAO dao = sqlSession.getMapper(MyDAO.class);
		return dao.writeContent(vo);
	}
	
	//게시글 삭제 처리
	@Override
	public int contentDelete(int board_sortnum) {
		return sqlSession.update("com.spring.lifecare.persistence.MyDAO.contentDelete", board_sortnum);
	}

	//admin 회원별 게시글 갯수
	@Override
	public int searchBoardCnt(String search) {
		return sqlSession.selectOne("com.spring.lifecare.persistence.MyDAO.searchBoardCnt", search);
	}
	
	//admin 총 게시글 조회
	@Override
	public List<BoardVO> adminboardList(Map<String, Object> map) {
		List<BoardVO> dtos = null;
		MyDAO dao = sqlSession.getMapper(MyDAO.class);
		dtos = dao.adminboardList(map);
		return dtos;
	}

	//admin 회원별 게시글 조회
	@Override
	public List<BoardVO> searchBoardList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.lifecare.persistence.MyDAO.searchBoardList", map);
	}

	//admin-회원글 상세조회
	@Override
	public BoardVO adminboardcontent(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.lifecare.persistence.MyDAO.adminboardcontent", map);
	}

	//admin 답변글쓰기
	@Override
	public int adminboardreply(BoardVO vo) {
		return sqlSession.update("com.spring.lifecare.persistence.MyDAO.adminboardreply", vo);
	}

	@Override
	public int adminboardreplydelete(int board_sortnum) {
		return sqlSession.update("com.spring.lifecare.persistence.MyDAO.adminboardreplydelete", board_sortnum);
	}
	
	// 진료결과 갯수 구하기
	@Override
	public int medicalCnt() {
		MyDAO dao = sqlSession.getMapper(MyDAO.class);
		return dao.medicalCnt();
	}
	
	// 진료결과 목록 조회
	//@Override
	public List<medicalVO> medicalList(Map<String, Object> map) {
		List<medicalVO> dtos = null;
		MyDAO dao = sqlSession.getMapper(MyDAO.class);
		dtos = dao.medicalList(map);
		return dtos;
	}
	
	//상세페이지 조회(한건의 정보 = 진료기록)
	@Override
	public medicalVO medicalnote(Map<String, Object> map) {
		MyDAO dao = sqlSession.getMapper(MyDAO.class);
		return dao.medicalnote(map);
	}

	//상세페이지 조회(한건의 정보 = 처방전기록)
	@Override
	public medicalVO prescriptionnote(Map<String, Object> map) {
		MyDAO dao = sqlSession.getMapper(MyDAO.class);
		return dao.prescriptionnote(map);
	}
}
