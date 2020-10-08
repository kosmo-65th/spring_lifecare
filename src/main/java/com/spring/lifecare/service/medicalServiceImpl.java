package com.spring.lifecare.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.lifecare.persistence.MyDAO;
import com.spring.lifecare.vo.medicalVO;

@Service
public class medicalServiceImpl implements medicalService {

	@Autowired
	MyDAO dao;
	
	//회원-게시글 목록
	@Override
	public void medicalList(HttpServletRequest req, Model model) {
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
		cnt = dao.medicalCnt();
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
		
		// session id값 받아오기
		String customer_id = (String)req.getSession().getAttribute("userSession");

		if(cnt > 0) {
			// 게시글 목록 조회
			Map<String, Object> map = new HashMap<String , Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("customer_id" , customer_id);
			List<medicalVO> dtos = dao.medicalList(map);
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

	//회원-진료기록부 상세 페이지
	@Override
	public void medicalcontentForm(HttpServletRequest req, Model model) {

		int diagnosis_num = Integer.parseInt(req.getParameter("diagnosis_num"));
		String customer_id = (String)req.getSession().getAttribute("userSession");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("customer_id", customer_id);
		map.put("diagnosis_num", diagnosis_num);
		
		// 상세페이지 조회
		medicalVO vo = dao.medicalnote(map);
		
		//6.request | session에 처리 결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("dto", vo);
	}

	//회원-처방전 상세 페이지
	@Override
	public void prescriptioncontentForm(HttpServletRequest req, Model model) {
		
		int diagnosis_num = Integer.parseInt(req.getParameter("diagnosis_num"));
		String customer_id = (String)req.getSession().getAttribute("userSession");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("customer_id", customer_id);
		map.put("diagnosis_num", diagnosis_num);
		
		// 상세페이지 조회
		medicalVO vo = dao.prescriptionnote(map);
		
		//6.request | session에 처리 결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("dto", vo);
		
	}
	
	//회원-결제된 진료내역 print
	@Override
	public void medicalprint(HttpServletRequest req, Model model) {
		
		int diagnosis_num = Integer.parseInt(req.getParameter("diagnosis_num"));
		String customer_id = (String)req.getSession().getAttribute("userSession");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("customer_id", customer_id);
		map.put("diagnosis_num", diagnosis_num);
		
		// 상세페이지 조회
		medicalVO vo = dao.medicalprint(map);
		
		//6.request | session에 처리 결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("dto", vo);
	}
	
	//회원-결제된 처방내용 print
	@Override
	public void prescriptionprint(HttpServletRequest req, Model model) {
		int diagnosis_num = Integer.parseInt(req.getParameter("diagnosis_num"));
		String customer_id = (String)req.getSession().getAttribute("userSession");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("customer_id", customer_id);
		map.put("diagnosis_num", diagnosis_num);
		
		// 상세페이지 조회
		medicalVO vo = dao.prescriptionprint(map);
		
		//6.request | session에 처리 결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("dto", vo);
	}
}
