package com.spring.lifecare.persistence;

import java.util.List;
import java.util.Map;

import com.spring.lifecare.vo.BoardVO;
import com.spring.lifecare.vo.medicalVO;


public interface MyDAO {
	
	//회원-게시글 갯수 구하기
	public int getArticleCnt(String customer_id);
	
	//회원-게시글 목록 조회(여러건의 정보)
	public List<BoardVO> getArticleList(Map<String, Object> map);
	
	//회원-상세페이지 조회(한건의 정보)
	public BoardVO getArticle(Map<String, Object> map);
	
	//회원-수정페이지 조회(한건의 정보)
	public BoardVO modifyArticle(int board_sortnum);
	
	//회원-비밀번호 인증(customer table)
	public String numPwdCheck(String customer_id);
	
	//회원-게시글 수정 처리
	public int updateContent(BoardVO vo);

	//회원-글쓰기 처리
	public int writeContent(BoardVO vo);
	
	//회원-게시글 삭제 처리
	public int contentDelete(int board_sortnum);
	
	////회원-답변글 조회(한건의 정보)
	//public BoardVO replyserch(int board_sortnum);
	
	//admin-회원글 검색
	public int searchBoardCnt(String search);
	
	//admin-총 게시글 조회
	public List<BoardVO> adminboardList(Map<String, Object> map); 
	
	//admin-회원글 리스트
	public List<BoardVO> searchBoardList(Map<String, Object> map);
	
	//admin-회원글 상세조회
	public BoardVO adminboardcontent(Map<String, Object> map);
	
	//admin-답변글쓰기
	public int adminboardreply(BoardVO vo);
	
	//admin-답변글삭제
	public int adminboardreplydelete(int board_sortnum);
	
	//회원-진료횟수 확인
	public int medicalCnt();
	
	//회원-진료횟수 목록 조회(여러건 조회)
	public List<medicalVO> medicalList(Map<String, Object> map);
	
	//회원-진료내용 상세 조회(한건의 정보 = 진료기록)
	public medicalVO medicalnote(Map<String, Object> map);
	
	//회원-처방전내용 상세 조회(한건의 정보 = 처방전 조회)
	public medicalVO prescriptionnote(Map<String, Object> map);
	
	//회원-결제된 진료내용 상세조회(한건의 정보 = 진료기록)
	public medicalVO medicalprint(Map<String, Object> map);
	
	//회원-결제된 처방전 상세조회(한건의 정보 = 진료기록)
	public medicalVO prescriptionprint(Map<String, Object> map);
	
	//회원-결제된 진단서 상세조회(한건의 정보 = 진료기록)
	public medicalVO diagnosisprint(Map<String, Object> map);
	
}
