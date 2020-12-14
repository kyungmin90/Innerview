package com.innerview.mvc00.item;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.innerview.mvc00.zzim.ZzimService;
import com.innerview.mvc00.zzim.ZzimVO;

@Controller
public class ItemController {

	@Autowired
	ItemService service;
	@Autowired
	ZzimService zzimservice;
	
	//제품 분야에 대한 리스트 출력 controller
	@RequestMapping("item/itemList.do")
	public void list(Model model, String iField1) {
		//ifield와 동일한 분야에 대한 제품을 list로 가져와 model로 출력
		List<ItemVO> list = service.list(iField1);
		model.addAttribute("list", list);
	}
	
	//제품 1개에 대한 상세 페이지 띄우는 controller
	@RequestMapping("item/itemDetail.do")
	public void one(String iCode, Model model, HttpSession session) {
		//상세 확인할 제품에 대한 데이터를 vo 담아서 model로 값 전달
		ItemVO vo = service.one(iCode);
		model.addAttribute("vo", vo);
		
		//제품의 주성분에 대해 추천제품이 담긴 리스트를 model로 값 전달
		List<ItemRecommendResultVO> list = service.recommend (vo.getiIngredient1(), vo);
		model.addAttribute("list",list);
		
		//찜DB에 값이 저장되어 있는지 확인하기 위해 VO에 값 저장
		String uid = (String) session.getAttribute("uID")+"";
		ZzimVO zvo = new ZzimVO();
		zvo.setiCode(Integer.parseInt(iCode));
		zvo.setuID(uid); 
		
		//VO(uid, icode)로 제품에 대한 DB저장값을 반환 // 1이면 있음, 0이면 없음
		int zzim = zzimservice.one(zvo);
		model.addAttribute("zzim",zzim);
	}
	
	//제품 설명 페이지(이미지) 띄우는 controller
	@RequestMapping("item/itemContentImage.do")
	public void image(String iContent, Model model) {
		//제품 리뷰 방문 후 다시 상세 페이지 확인하기 위해 값을 저장하고 다시 출력
		String Content = iContent;
		model.addAttribute("image", Content);
	}
	
	//제품비교함 담기 버튼 누르면 vo를 세션으로 저장하는 controller
	@RequestMapping("item/itemCompareImage.do")
	public void compare(String iCode, String iImage, Model model, HttpSession session) {
		//비교제품을 담을 list 생성
		ArrayList<ItemCompareVO> list = null;

		//list에 담을 vo 생성
		ItemCompareVO vo = new ItemCompareVO();
		vo.setiCode(iCode);
		vo.setiImage(iImage);

		//같은 제품인지 확인 해줄 boolean형 flag
		boolean insert = true;
		
		//세션"list"가 있는지 없는지 확인
		if (session.getAttribute("list") != null) {
			//기존 세션"list"가 있으면 list에 기존 세션"list"를 삽입
			list = (ArrayList<ItemCompareVO>)session.getAttribute("list");
			//리스트에 같은 제품을 넣지 않도록 판단
			for (int i = 0; i < list.size(); i++) {
				//리스트 안에 있는 bag과 이제 담길 vo의 icode와 비교
				ItemCompareVO bag = list.get(i);
				if (bag.getiCode().equals(iCode)) {
					insert = false;
					break;
				}
			}
			//리스트의 사이즈(3)미만 이고, 중복된 값이 없으면 list에 vo를 저장
			if (list.size() < 3 && insert == true) {
				list.add(vo);
			//리스트의 사이즈가 3이면 flag세션에 false를 저장 해서 더 추가 하지 못하도록 막음 
			}else if(list.size() == 3) {
				session.setAttribute("flag", "false");
			}
		//list가 null인 경우
		} else {
			//vo를 list에 저장
			list = new ArrayList<>();
			list.add(vo);
		}
		//세션에 list와 listsize를 저장
		session.setAttribute("list", list); //비교 목록 세션
		session.setAttribute("size2", list.size()); //비교 목록 사이즈
		//model에 저장하여 views밑 화면에 찍어줌
		model.addAttribute("insert", insert);
		model.addAttribute("size2", list.size());
		model.addAttribute("image", iImage); 
	}

	//비교하기 버튼
	@RequestMapping("item/itemCompareModal.do")
	public void compareitem(HttpSession session, Model model) {
		//세션으로 저장된 값을 리스트에 저장
		ArrayList<ItemCompareVO> list = (ArrayList<ItemCompareVO>) session.getAttribute("list");
		List<ItemVO> compList =  new ArrayList<ItemVO>();
		//세션에 담겨있는 list의 길이 만큼 반복
		for (int i = 0; i < list.size(); i++) {
			ItemCompareVO bag = list.get(i);
			String iCode = bag.getiCode();
			//icode로 각 제품에 대한 정보 가져오기
			ItemVO vo = service.one(iCode);
			//complist에 저장
			compList.add(vo);
		}
		//complist를 model로 전달
		model.addAttribute("complist", compList);
	}
	
	//비교함 비우기
	@RequestMapping("item/itemCompareRemove.do")
	public void comparerevome(String iCode, Model model) {
		model.addAttribute("iCode",iCode);
	}

}
