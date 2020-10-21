package com.spring.lifecare.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.lifecare.persistence.MyDAO;
import com.spring.lifecare.vo.BoardVO;


@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	MyDAO dao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	//회원-게시글 목록
	@Override
	public void boardList(HttpServletRequest req, Model model) {
		// session id값 받아오기
		String customer_id = (String)req.getSession().getAttribute("userSession");
				
		// 페이징
		int pageSize = 10;	//한 페이지당 출력할 글 갯수
		int pageBlock = 3;	//한 블럭당 페이지 갯수
		
		int cnt = 0;			//글 갯수
		int start = 0;			//현재 페이지 시작 글 번호
		int end = 0;			//현재 페이지 마지막 글 번호
		int number = 0;			//출력용 글 번호
		String pageNum = "";	//페이지 번호
		int currentPage = 0;	//현재 페이지
		
		int pageCount = 0;	//페이지 갯수
		int startPage = 0;	//시작 페이지
		int endPage = 0;	//마지막 페이지

		// 글 갯수 구하기
		cnt = dao.getArticleCnt(customer_id);
		System.out.println("=====================");
		System.out.println("cnt = " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	//첫페이지를 1로 지정
		}
		
		//글 30건 기준
		currentPage = Integer.parseInt(pageNum);	//현재 페이지 = 1
		System.out.println("currentPage[현재 페이지] : " + currentPage);
		
		//페이지 갯수 6 = (30/5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); //페이지 갯수 + 나머지가 있으면 1을 더해라
		
		//현재 페이지 시작 글번호(페이지 별)
		//1 = (1 - 1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1;
		
		//현재 페이지 마지막 글번호(페이지 별)
		//5 = 1 + 5 - 1
		end = start + pageSize - 1;
		
		System.out.println("start[현재 페이지의 첫번째 글번호] : " + start);
		System.out.println("end[현재 페이지의 마지막 글번호] : " + end);
		
		//출력용 글번호
		//30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize;
		
		System.out.println("number : " + number);
		System.out.println("pageSize[한페이지에 나타날 건수] : " + pageSize);
		

		if(cnt > 0) {
			// 게시글 목록 조회
			Map<String, Object> map = new HashMap<String , Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("customer_id" , customer_id);
			List<BoardVO> dtos = dao.getArticleList(map);
			model.addAttribute("dtos", dtos);
		}
		
		//6.request | session에 처리 결과를 저장(jsp에 전달하기 위함)
		//시작 페이지
		//1 = (1 / 3) * 3 + 1
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		System.out.println("startPage[시작 페이지 번호] : " + startPage);

		//마지막 페이지 
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("pageBlock : " + pageBlock);
		System.out.println("endPage[끝 페이지 번호] : " + endPage);
		System.out.println("=====================");
		
		model.addAttribute("cnt", cnt);	//글 갯수
		model.addAttribute("number", number); //출력용 글 번호
		model.addAttribute("pageNum", pageNum);	//페이지 번호
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);	//시작 페이지
			model.addAttribute("endPage", endPage);		//끝 페이지
			model.addAttribute("pageBlock", pageBlock);	//한 블럭당 페이지 수
			model.addAttribute("pageCount", pageCount);	//페이지 개수
			model.addAttribute("currentPage", currentPage);	//현재 페이지
		}
	}

	//회원-게시글 상세 페이지
	@Override
	public void contentForm(HttpServletRequest req, Model model) {

		int board_sortnum = Integer.parseInt(req.getParameter("board_sortnum"));
		String customer_id = (String)req.getSession().getAttribute("userSession");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("customer_id", customer_id);
		map.put("board_sortnum", board_sortnum);
		
		// 상세페이지 조회
		BoardVO vo = dao.getArticle(map);
		
		//6.request | session에 처리 결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("dto", vo);
	}

	//회원-글 수정 상세 페이지
	@Override
	public void modifyView(HttpServletRequest req, Model model) {
		
		int board_sortnum = Integer.parseInt(req.getParameter("board_sortnum"));
		String customer_id = (String)req.getSession().getAttribute("userSession");
		String customer_pw = req.getParameter("customer_pw");
		String encoderPw = dao.numPwdCheck(customer_id);
		int selectCnt = 0;
		
		// 비밀번호 일치 시 해당 글 한건을 BoardVO 바구니에 담음
		if(passwordEncoder.matches(customer_pw, encoderPw)) {
			BoardVO vo = dao.modifyArticle(board_sortnum);
			model.addAttribute("dto", vo);
			selectCnt = 1;
		} 
		
		// request | session에 처리 결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("board_sortnum", board_sortnum);
	}

	//회원-게시글 수정 처리
	@Override
	public void modifyPro(HttpServletRequest req, Model model) {
		
		int board_sortnum = Integer.parseInt(req.getParameter("board_sortnum"));
		String board_subject = req.getParameter("board_subject");
		String board_content = req.getParameter("board_content");
		
		BoardVO vo = new BoardVO();
		
		vo.setBoard_sortnum(board_sortnum);
		vo.setBoard_subject(board_subject);
		vo.setBoard_content(board_content);
		
		int UpdateContent = dao.updateContent(vo);
		
		//6.request | session에 처리 결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("UpdateContent", UpdateContent);
	}

	//회원-글쓰기 페이지
	@Override
	public void writeForm(HttpServletRequest req, Model model) {

		String customer_id = (String)req.getSession().getAttribute("userSession");
		String board_subject = req.getParameter("board_subject");
		String board_content = req.getParameter("board_content");
		
		BoardVO vo = new BoardVO();
		
		vo.setCustomer_id("customer_id");
		vo.setBoard_subject("board_subject");
		vo.setBoard_content("board_content");
		
		model.addAttribute("customer_id", customer_id);
		model.addAttribute("board_subject", board_subject);
		model.addAttribute("board_content", board_content);
	}

	//회원-글쓰기 처리 페이지
	@Override
	public void writePro(HttpServletRequest req, Model model) {
		
		// BoardVO 오브젝트 생성
		BoardVO vo = new BoardVO();
		
		vo.setCustomer_id((String)req.getSession().getAttribute("userSession"));
		vo.setBoard_subject(req.getParameter("board_subject"));
		vo.setBoard_content(req.getParameter("board_content"));
			
		// 글쓰기 처리
		int writeQA = dao.writeContent(vo);
		
		//6.request | session에 처리 결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("writeQA", writeQA);
	}

	//회원-게시글 삭제 처리 페이지
	@Override
	public void deletePro(HttpServletRequest req, Model model) {
		
		int board_sortnum = Integer.parseInt(req.getParameter("board_sortnum"));
		String customer_id = (String)req.getSession().getAttribute("userSession");
		String customer_pw = req.getParameter("customer_pw");
		String encoderPw = dao.numPwdCheck(customer_id);
		int userDelete = 0;
		
		//비밀번호 일치 시 해당 글 한건을 BoardVO 바구니에 담음
		if(passwordEncoder.matches(customer_pw, encoderPw)) {
			int deleteCnt = dao.contentDelete(board_sortnum);
			model.addAttribute("deleteCnt", deleteCnt);
			userDelete = 1;
		} 
		
		//6.request | session에 처리 결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("userDelete", userDelete);
		model.addAttribute("board_sortnum", board_sortnum);
	}

	
	//admin-총 게시글 페이지
	@Override
	public void adminboardList(HttpServletRequest req, Model model) {
		//3.변수선언
		int pageSize = 10;     //한페이지당 출력할 글 갯수
        int pageBlock = 5;     //한 블럭당 페이지 갯수
        int cnt = 0;        //글 갯수
        int start = 0;         //현재글 시작번호
        int end = 0;         //현재 페이지 마지막 글 번호
        int currentPage=0;    //현재페이지
        int number = 0;
        int pageCount = 0;    //페이지 갯수
        int startPage = 0;    //시작페이지
        int endPage = 0;    //마지막페이지
        
        String search="";
        List<BoardVO> boards=null;
        
        	//4. 변수 받아오기 및 변수 설정
        if(req.getParameter("pageSize")!=null)pageSize=Integer.parseInt(req.getParameter("pageSize"));
       
        if(req.getParameter("currentPage")!=null)currentPage=Integer.parseInt(req.getParameter("currentPage"));
        else {currentPage=1;}
        if(req.getParameter("search")!=null)search=req.getParameter("search");
        System.out.println("CurrentPage : " + currentPage);
        System.out.println("Search :"+search);
        
        	//5. dao 인스턴스 
		if(search=="") {cnt = dao.adminArticleCnt();}
		else {cnt = dao.searchBoardCnt(search);}
		
        	//페이지 갯수
        pageCount = cnt/pageSize +(cnt%pageSize>0 ? 1 : 0);
        	//현재 페이지 시작 글번호(페이지별)
        start=(currentPage-1)*pageSize +1;
        startPage = (currentPage / pageBlock) * pageBlock +1;
        if(currentPage % pageBlock==0) startPage -=pageBlock;
            //현재 페이지 마지막 글번호(페이지별)
        end=start+pageSize-1;
        endPage = startPage + pageBlock-1;
        if(endPage > pageCount) endPage = pageCount;
        
        System.out.println("start : "+start);
        System.out.println("end : "+end);
        
        number = cnt - (currentPage - 1) * pageSize;
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start", start);
        map.put("end", end);
        map.put("search", search);
        
        if(search=="") {boards= dao.adminboardList(map);}
        else {boards = dao.searchBoardList(map);}
		//5. 자료값으로 정리
		model.addAttribute("boards", boards);
		model.addAttribute("cnt", cnt);    //글갯수
	    model.addAttribute("currentPage", currentPage);//페이지 번호
	    model.addAttribute("number", number); //출력용 글 번호
        if(cnt > 0 ) {
            model.addAttribute("startPage",startPage);
            model.addAttribute("endPage",endPage);
            model.addAttribute("pageBlock",pageBlock);
            model.addAttribute("pageCount",pageCount);
        }
	}

	//admin-총 게시글 상세 페이지
	@Override
	public void adminboardcontent(HttpServletRequest req, Model model) {
		
		int boardNum = Integer.parseInt(req.getParameter("board_sortnum"));
		// 상세페이지 조회
		BoardVO vo = dao.adminboardcontent(boardNum);
		//6.request | session에 처리 결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("dto" , vo);
		
	}

	//admin-게시글 답변
	@Override
	public void adminboardreply(HttpServletRequest req, Model model) {
		
		int boardNum = Integer.parseInt(req.getParameter("board_sortnum"));
		String board_reply = req.getParameter("board_reply");
		
		System.out.println(board_reply);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		map.put("board_reply", board_reply);
		map.put("re", "O");
		
		int makeReCnt=dao.adminboardreply(map);
		dao.updatere(map);
		
		//model.addAttribute("makeReCnt",makeReCnt);
		req.setAttribute("makeReCnt",makeReCnt);
	}
 
	//admin-게시글 답변 삭제
	@Override
	public void adminboardreplydelete(HttpServletRequest req, Model model) {
		
		int board_sortnum = Integer.parseInt(req.getParameter("board_sortnum"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_sortnum", board_sortnum);
		map.put("board_replycode", "X");
		
		int deleteCnt = dao.adminboardreplydelete(map);
		
		//6.request | session에 처리 결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("deleteCnt", deleteCnt);
		
	}
	
	// admin-게시글 답변 수정
	@Override
	public void replyupdate(HttpServletRequest req, Model model) {
		int boardNum = Integer.parseInt(req.getParameter("boardNum"));
		String re_content = req.getParameter("board_reply");
		int updateCnt = 0;
		String re="";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		map.put("re_content", re_content);
		
		updateCnt = dao.adminboardreply(map);
		if(updateCnt==1) {
			re = re_content;
		}
		model.addAttribute("re",re);
	}
	
	// admin - 본글 삭제
	@Override
	public void boarddelete(HttpServletRequest req, Model model) {
		int board_sortnum = Integer.parseInt(req.getParameter("board_sortnum"));
		
		int deleteCnt = dao.boarddelete(board_sortnum);
		
		model.addAttribute("deleteCnt", deleteCnt);
		
	}
}
