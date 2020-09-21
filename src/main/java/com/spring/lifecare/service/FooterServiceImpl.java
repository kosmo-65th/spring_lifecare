package com.spring.lifecare.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.lifecare.persistence.FooterDao;
import com.spring.lifecare.vo.FooterBoard_drug;
import com.spring.lifecare.vo.FooterBoard_medecine;
import com.spring.lifecare.vo.FooterBoard_proofCost;
import com.spring.lifecare.vo.FooterBoard_treatment;





@Service
public class FooterServiceImpl implements FooterService {
	
	@Autowired
	FooterDao dao;
	
	//트리트먼드 게시글 뿌리기
	@Override
	public void treatment(HttpServletRequest req, Model model, String code) {

		//게시글 타입 코드 뿌려주기
		if(code==null||code.equals("")) {
			code="1";
		}
		model.addAttribute("code",code);
		
		
		
		String curPage=req.getParameter("nowPage");
		if(curPage==null||curPage.equals("")) {
			curPage="1";
		}
		int nowPage=0;
		int total=0;
		int maxList=0;
		int startList=0;
		int endList=0;
		int number=0;
		int totalBlock=0;
		int startBlock=0;
		int maxBlock=0;
		int endBlock=0;
		
		////검색어////
		String word=req.getParameter("word");
		
		if(word==null||word.equals("")) {
			word="";
		}
		
		//코드별로 다른 게시글을 가져온다 
		
		//코드별 게시글 총 수
		String a="";
		if(code.equals("1")) {
			
			a=dao.totalTreatMent(word);
			
		}else if(code.equals("2")) {
			
			a=dao.totalMedecine(word);
			
		}else if(code.equals("3")) {
			
			a=dao.totaldrugs(word);
			
		}else if(code.equals("4")) {
			a=dao.totalproof_cost(word);
		}
		
		total=Integer.parseInt(a);							//전체글수
		nowPage=Integer.parseInt(curPage);					//현제페이지
		
		///////////게시물//////////////////////////////////////////////////////////////////////
		maxList=10;											//한 페이지에 뿌려 줄 글수
		startList=(nowPage-1)*maxList+1;					//페이지당 게시글시작 번호
		endList=startList+maxList-1;						//페이지당 게시글 끝 번호
		number=total-(nowPage-1)*maxList;					//형식상 보여줄 글번호(jsp단에서 게시물이 소환 될때마다 -1해주면된다)
		//////////////////////////////////////////////////////////////////////////////////////
		
		///////////블록////////////////////////////////////////////////////////////////////////
		totalBlock=(total/maxList)+(total%maxList>0?1:0);	//전체페이지블록

		maxBlock=10;										//한번에 보여즐 페이지 블록
		
		startBlock=(nowPage/maxBlock)*maxBlock+1;				//시작하는 페이지 블록
		if(nowPage%maxBlock==0)startBlock=startBlock-maxBlock;	//->현제페이지가 한번에 보여즐 블록의 숫자와 같을경우 블록을 넘기지 않도록
		
		endBlock=startBlock+maxBlock-1;						//끝나는 페이지 블록 
		if(endBlock>totalBlock)endBlock=totalBlock;			//끝나는 페이지가 총블록의 겟수를 넘기지 못하도록한다.
		///////////////////////////////////////////////////////////////////////////////////////
		
		
		model.addAttribute("total", total);
		model.addAttribute("number", number);
		model.addAttribute("nowPage",nowPage);
		
		if(total>0) {
			model.addAttribute("nowPage",nowPage);
			model.addAttribute("startList", startList);
			model.addAttribute("endList", endList);
			
			model.addAttribute("totalBlock", totalBlock);
			model.addAttribute("maxBlock", maxBlock);
			model.addAttribute("startBlock", startBlock);
			model.addAttribute("endBlock", endBlock);
			
			//게시글 가져오기
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("startList", startList);
			map.put("endList", endList);
			map.put("word", word);
			
			//코드별로 게시글 가져오기//////////////
			if(code.equals("1")) {
				
				ArrayList<FooterBoard_treatment> vo=dao.treatMent(map);
				//검색어 볼드값 주기
				for(int i=0; i<vo.size(); i++) {
					String writer=vo.get(i).getName().replace(word, "<b>"+word+"</b>");
					vo.get(i).setName(writer);
				}
				//게시물 뿌리기
				model.addAttribute("vo", vo);
				
			}else if(code.equals("2")) {
				ArrayList<FooterBoard_medecine> vo=dao.medecine(map);
				
				//검색어 볼드값 주기
				for(int i=0; i<vo.size(); i++) {
					String writer=vo.get(i).getName().replace(word, "<b>"+word+"</b>");
					vo.get(i).setName(writer);
				}
				//게시물 뿌리기
				model.addAttribute("vo", vo);
			}else if(code.equals("3")) {
				ArrayList<FooterBoard_drug> vo=dao.drug(map);
				
				//검색어 볼드값 주기
				for(int i=0; i<vo.size(); i++) {
					String writer=vo.get(i).getName().replace(word, "<b>"+word+"</b>");
					vo.get(i).setName(writer);
				}
				//게시물 뿌리기
				model.addAttribute("vo", vo);
				
			}else if(code.equals("4")) {
				ArrayList<FooterBoard_proofCost> vo=dao.proof_cost(map);
				
				//검색어 볼드값 주기
				for(int i=0; i<vo.size(); i++) {
					String writer=vo.get(i).getName().replace(word, "<b>"+word+"</b>");
					vo.get(i).setName(writer);
				}
				//게시물 뿌리기
				model.addAttribute("vo", vo);
				
			}
			
			//검색단어
			model.addAttribute("word", word);
		}
		
		
		
	}
	
	//메디신 게시글 뿌리기
	@Override
	public void medecine() {
		
	}
	//드럭 게시글 뿌리기
	@Override
	public void drugs() {
		
	}
	
	//푸루프 비용 게시글 뿌리기
	@Override
	public void proof_cost() {
		
	}
	
	
	
	
	
}
