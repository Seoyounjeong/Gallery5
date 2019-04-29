package com.hk1.gallery;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk1.gallery.dto.DabgeulDto;
import com.hk1.gallery.dto.ExhibitionDto;
import com.hk1.gallery.dto.ItemDto;
import com.hk1.gallery.dto.KyungmaeDto;
import com.hk1.gallery.dto.MemberDto;
import com.hk1.gallery.service.DabgeulService;
import com.hk1.gallery.service.IExhibitionService;
import com.hk1.gallery.service.IItemService;
import com.hk1.gallery.service.IMemberService;
import com.hk1.gallery.service.KyungmaeService;


/**
 * 작성자 : 조용권
 * 1 로그인 관련
 * 2 작품 올리기 관련
 * 
 * 
 */
@Controller
public class HomeController {

	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private IItemService itemService;
	
	@Autowired
	private IExhibitionService exhibitionService;
	
	@Autowired
	private DabgeulService dabgeulService;
	
	@Autowired
	private KyungmaeService kyungmaeService;
//-↓로그인관련-------------------------------------------------------------------------------------------------------------	
	
	//로그인 폼 호출
	@RequestMapping(value = "/loginform.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String loginform(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
		logger.info("/loginform.do{}.", locale);
		
		return "login/loginform";
	}
	@RequestMapping(value = "/callback.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String callback(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
		
		return "login/callback";
	}
	//로그인 or 회원가입폼 호출
	@RequestMapping(value = "/checkMember.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String checkMember(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
		logger.info("checkMember.do.", locale);
		
		HttpSession session = request.getSession();
		
		String m_id = request.getParameter("email");
		String m_name = request.getParameter("nickname");
		System.out.println("m_id ["+m_id+"]");
		MemberDto memberDto = memberService.selectMember(m_id);
	
		if(memberDto==null) {
			request.setAttribute("m_id", m_id);
			request.setAttribute("m_name", m_name);
			
			return "login/insertMember";
		}else {
			session.setAttribute("loginMember", memberDto);
			return "redirect:index.jsp";
		}
		
	}
	//회원가입
	@RequestMapping(value = "/insertMember.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String insertMember(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model, MemberDto memberDto) {
		logger.info("insertMember.do.", locale);
		
		HttpSession session = request.getSession();
		
		String m_tel = (String)request.getParameter("m_tel1")+
						(String)request.getParameter("m_tel2")+
						(String)request.getParameter("m_tel3");
		int m_grade = 1;

		memberDto.setM_tel(m_tel)
				 .setM_grade(m_grade);
		
		if(memberService.insertMember(memberDto)) {
			MemberDto loginMember = memberService.selectMember(memberDto.getM_id());
			session.setAttribute("loginMember", memberDto);
			return "redirect:index.jsp";
		}else {
			//error
			System.out.println("insertMember error");
			return "error";
		}
	
	}
	//로그아웃
	@RequestMapping(value = "/logout.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String logout(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
		logger.info("logout.do.", locale);
		
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:index.jsp";
	}
	//회원 개인정보 페이지
	@RequestMapping(value = "/privatemain.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String privatemain(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
		logger.info("privatemain.do.", locale);
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("logimMember");
		
		return "login/updateMemberForm";
	}
	//회원 개인정보 수정폼 호출
	@RequestMapping(value = "/myprivate.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String myprivate(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
		logger.info("myprivate.do.", locale);
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("logimMember");
		
		return "login/updateMemberForm";
	}
	//회원 개인정보 수정폼 호출
	@RequestMapping(value = "/updateMember.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String updateMember(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,MemberDto memberDto) {
		logger.info("updateMember.do.", locale);
		
		HttpSession session = request.getSession();
	

		String m_tel = (String)request.getParameter("m_tel1")+
					(String)request.getParameter("m_tel2")+
					(String)request.getParameter("m_tel3");
	
		memberDto.setM_tel(m_tel);
		if(memberService.updateMember(memberDto)) {
		session.removeAttribute("loginMember");
		session.setAttribute("loginMember", memberDto);
		return "login/updateMemberForm";
		}else {
		//error
		System.out.println("insertMember error");
		return "error";
		}
	
	}
	//구매목록 
	@RequestMapping(value = "/myItemList.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String myItmeList(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
		logger.info("myItemList.do.", locale);
		
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("loginMember");
		int m_no =memberDto.getM_no();
		List<ItemDto> myItemList =itemService.selectM_noItemList(m_no);
		model.addAttribute("myItemList", myItemList);
		
		return "login/myItemList";
	}
	//작가 . 갤러리 신청 호출 폼
	@RequestMapping(value = "/upgradeMember.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String upgradeMember(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
		logger.info("upgradeMember.do.", locale);
		
		return "login/upgradeMember";
	}
	
//-↓작품테이블관련 / ↑로그인관련-------------------------------------------------------------------------------------------------------------	
	
	//작품올리기 폼 호출 
	@RequestMapping(value = "/insertItemForm.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String insertItemForm(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
		logger.info("insertItemForm.do.", locale);
			
			return "Item/insertItemForm";
		}
	//작품 올리기
	@RequestMapping(value = "/insertItem.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String insertItem(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,ItemDto itemDto) {
		logger.info("insertItem.do.", locale);
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;
		//요청파일 가져오기
		MultipartFile  multifile = multi.getFile("filename");	
		String origin_fname=multifile.getOriginalFilename();
		
		System.out.println("origin_fname : ["+ origin_fname+"]");
		String creatUUID = UUID.randomUUID().toString().replaceAll("-", "");
		
		System.out.println("creatUUID : ["+ creatUUID+"]");
		String stored_fname = creatUUID +origin_fname
				.substring(origin_fname.lastIndexOf("."));
		System.out.println("stored_fname : ["+ stored_fname+"]");
		
		//파일객체 구하기
		File f = new File("C:/Users/hk-edu/git/gallery/Gallery/src/main/webapp/itemupload/"+stored_fname);

		itemDto.setI_img(stored_fname);
		try {
		
			multifile.transferTo(f);
			itemService.insertItem(itemDto);
			
		} catch (IllegalStateException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		return "redirect:artistsItemList.do";
		}
	//내 작품목록
	@RequestMapping(value = "/artistsItemList.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String artistsItemList(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
		logger.info("artistsItemList.do.", locale);
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("loginMember");
		int a_no =memberDto.getM_no();
		List<ItemDto> myItemList =itemService.selectA_noItemList(a_no);
		System.out.println("myItemList : ["+myItemList.get(myItemList.size()-1)+"]");
		model.addAttribute("myItemList", myItemList);
			
			return "Item/artistsItemList";
		}
	
	//작품삭제
	@RequestMapping(value = "/deleteitem.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String deleteitem(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
			logger.info("deleteitem.do.", locale);
			int i_no = Integer.parseInt(request.getParameter("i_no"));
				if(itemService.deleteItem(i_no)) {
					return "redirect:artistsItemList.do";
				}else {
					return "error";
				}
				
			}
	//내 작품상세정보(ajax event)
	@ResponseBody
	@RequestMapping(value = "/selectItem.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public Map<String , ItemDto> selectItem(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
			logger.info("artistsItemList.do.", locale);
				
			int i_no = Integer.parseInt(request.getParameter("i_no"));
		
			ItemDto item = itemService.selectItem(i_no);
			
			Map<String , ItemDto> map = new HashMap<String , ItemDto>();
			map.put("item", item);
			model.addAttribute("item", item);
					
					return map;
			}
	//작품 수정완료
	@RequestMapping(value = "/artistUpdateitem.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String artistUpdateitem(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model ,ItemDto itemDto) {
			logger.info("artistUpdateitem.do.", locale);
			if(itemService.updateItem(itemDto)) {
				return "redirect:artistsItemList.do";
			}else {
				return "error";
			}
				
			}	
	
//-↓전시관련 / ↑작품관련-------------------------------------------------------------------------------------------------------------		
	
	//전시등록 폼 호출 
		@RequestMapping(value = "/insertExhibitionForm.do",  method = {RequestMethod.POST, RequestMethod.GET})
		public String insertExhibitionForm(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
			logger.info("insertExhibitionForm.do.", locale);
			
			HttpSession session = request.getSession();
			MemberDto memberDto = (MemberDto) session.getAttribute("loginMember");
			int a_no =memberDto.getM_no();
			List<ItemDto> myItemList =itemService.selectA_noItemList(a_no);
			model.addAttribute("myItemList", myItemList);			
				return "Exhibition/insertExhibitionForm";
			}
	
	//전시등록 
	@RequestMapping(value = "/insertExhibition.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String insertExhibition(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,int[] i_no) {
		logger.info("insertExhibition.do.", locale);
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;
		//요청파일 가져오기
		MultipartFile  multifile = multi.getFile("filename");	
		String origin_fname=multifile.getOriginalFilename();
		
		String creatUUID = UUID.randomUUID().toString().replaceAll("-", "");
		
		String stored_fname = creatUUID +origin_fname
				.substring(origin_fname.lastIndexOf("."));
		int a_no =Integer.parseInt(request.getParameter("a_no"));
		
		//파일객체 구하기
		File f = new File("C:/Users/hk-edu/git/gallery/Gallery/src/main/webapp/exhibitionupload/"+stored_fname);
		
	
		try {
		
			multifile.transferTo(f);
			ExhibitionDto exhibitionDto = new ExhibitionDto();
			exhibitionDto.setA_name(request.getParameter("a_name"))
			  			 .setA_no(Integer.parseInt(request.getParameter("a_no")))
			  			 .setE_title(request.getParameter("e_title"))
			  			 .setE_explain(request.getParameter("e_explain"))
			  			 .setE_img(stored_fname);
			if(exhibitionService.insertExhibition(exhibitionDto)) {	
				int e_no =exhibitionDto.getE_no();
				if(itemService.updateItem(i_no, e_no)) {
					request.setAttribute("a_no", a_no);
					return "redirect:myExhibition.do";  
				}
			}else {
				System.out.println("insertExhibition error");
				return "error";
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} 
		
		request.setAttribute("a_no", a_no);
		return "redirect:myExhibition.do";  
		}
	//전시목록
	@RequestMapping(value = "/exhibitionlist.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String exhibitionlist(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
		logger.info("exhibitionlist.do.", locale);
		
		List<ExhibitionDto> exhibitionList =exhibitionService.selectExhibitionList();
		
		model.addAttribute("exhibitionList", exhibitionList);
			
			return "Exhibition/exhibitionList";
		}
	//전시상세보기
	@RequestMapping(value = "/detailExhibition.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String detailExhibition(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,int e_no) {
		logger.info("detailExhibition.do.", locale);
			
		ExhibitionDto exhibitionDto =exhibitionService.selectExhibition(e_no);
		List<ItemDto> itemList = itemService.selectE_noItemList(e_no);
		 List<DabgeulDto> Dlist = dabgeulService.selectDabgeulList(e_no);
	    
	      
	      
	     model.addAttribute("Dlist",Dlist);
	   
		model.addAttribute("exhibitionDto", exhibitionDto);
		
		model.addAttribute("itemList" ,itemList);
			return "Exhibition/detailExhibition";
		}	
	//전시삭제
	@RequestMapping(value = "/deleteExhibition.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String deleteExhibition(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model, int e_no, int a_no) {
		logger.info("deleteExhibition.do.", locale);
				
		if(exhibitionService.deleteExhibition(e_no)) {
			request.setAttribute("a_no", a_no);
			return "redirect:Exhibition/myExhibition.do";  
		}else {
			return "error";
		}
			
			}	
	//나의 전시목록
	@RequestMapping(value = "/myExhibitionList.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String myExhibitionlist(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,int a_no) {
		logger.info("myExhibitionList.do.", locale);
		System.out.println("a_no : ["+a_no+"]");
		List<ExhibitionDto> exhibitionList =exhibitionService.selectExhibitionList(a_no);

		model.addAttribute("exhibitionList", exhibitionList);
			
			return "Exhibition/myExhibitionList";
		}
	//전시수정 폼 호출
	@RequestMapping(value = "/updateExhibitionForm.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String updateExhibitionForm(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,int e_no ,int a_no) {
		logger.info("updateExhibitionForm.do.", locale);
				
		ExhibitionDto exhibitionDto =exhibitionService.selectExhibition(e_no);
		List<ItemDto> itemList = itemService.selectE_noItemList(e_no);
		List<ItemDto> myitemList = itemService.selectA_noItemList(a_no);
		model.addAttribute("exhibitionDto", exhibitionDto);
		model.addAttribute("itemList" ,itemList);
		model.addAttribute("myitemList", myitemList);
			return "Exhibition/updateExhibitionForm";
		}	
	//전시 수정
	@RequestMapping(value = "/updateExhibition.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String updateExhibition(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,int[] Updatei_no,int[] Deletei_no) {
		logger.info("updateExhibition.do.", locale);
		System.out.println("1");
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;
		System.out.println("1.5");
		ExhibitionDto exhibitionDto = new ExhibitionDto();
		System.out.println("2");
		MultipartFile filename = multi.getFile("filename");
		System.out.println("3");
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		System.out.println("4");
		System.out.println("a_no a_no : ["+a_no+"]");
		System.out.println("5");
		
		if(filename!=null) {
		System.out.println("6");
		
		
		MultipartFile  multifile = multi.getFile("filename");
		

		
			//요청파일 가져오기
			
				
			
			String origin_fname=multifile.getOriginalFilename();
			
			String creatUUID = UUID.randomUUID().toString().replaceAll("-", "");
			
			String stored_fname = creatUUID +origin_fname
					.substring(origin_fname.lastIndexOf("."));
			//파일객체 구하기
			File f = new File("C:/Users/hk-edu/git/gallery/Gallery/src/main/webapp/exhibitionupload/"+stored_fname);
	
				try {
						multifile.transferTo(f);	
						exhibitionDto.setE_img(stored_fname);
					} catch (Exception e) {	
						e.printStackTrace();	
					} 
		}else {
			exhibitionDto.setE_img(request.getParameter("e_img"));
		}
		
			exhibitionDto.setE_no(Integer.parseInt(request.getParameter("e_no")))
					 .setA_name(request.getParameter("a_name"))
		  			 .setA_no(Integer.parseInt(request.getParameter("a_no")))
		  			 .setE_title(request.getParameter("e_title"))
		  			 .setE_explain(request.getParameter("e_explain"));
		  			 
		if(exhibitionService.updateExhibition(exhibitionDto)){	
			int e_no =exhibitionDto.getE_no();
		
			if(Updatei_no==null) {
				
			}else {
				itemService.updateItem(Updatei_no, e_no);
				
			}
			if(Deletei_no==null) {
				
			}else {
				itemService.updateItem(Deletei_no, 0);
			}
	
				return "redirect:myExhibitionList.do?a_no="+a_no;  
			
		}else {
			System.out.println("updateExhibition error");
			return "error";
		}
		
		
		
		}
	
//-↓경매관련 / ↑전시관련------------------------------------------------------------------------------------------------------------		

	//경매 등록 테스트 후  진행중인경매라면 true -> -값을 받아서-경매 진행 폼이동 /  false : 경매진행 폼이동  
			@RequestMapping(value = "/insertKyungmaeform.do",  method = {RequestMethod.POST, RequestMethod.GET})
			public String insertKyungmaeform(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model , int i_no) {
				logger.info("insertKyungmaeform.do.", locale);
				ItemDto itemDto = itemService.selectItem(i_no);
				KyungmaeDto kyungmaeDto =kyungmaeService.selectI_noKyungmae(i_no);
				
				
				if(kyungmaeDto==null) {
					request.setAttribute("itemDto", itemDto);
					//인서트폼 
					return "Kyungmae/insertKyungmaeForm";
				}else if(kyungmaeDto != null){
					if((kyungmaeDto.getK_state()).equals("종료")) {
						//pop up 창 종료
						return "Kyungmae/successKyungmaeForm";
					}else if((kyungmaeDto.getK_state()).equals("진행중")){
						//update 폼 이동 

						
						
						//원래 가격
						int beforePrice = itemDto.getI_price();
						
						//원래가격 가격에 따른 추가 금액 설정
						
						int plusPrice=plusPrice(beforePrice);
						int nextPrice =beforePrice+ plusPrice;
						request.setAttribute("nextPrice", nextPrice);
						request.setAttribute("kyungmaeDto", kyungmaeDto);
						request.setAttribute("itemDto", itemDto);
						return "Kyungmae/updateKyungmaeForm";
					}
				}
				return "error";
				
					
				}
	 //경매등록
			@RequestMapping(value = "/insertKyungmae.do",  method = {RequestMethod.POST, RequestMethod.GET})
			public String insertKyungmae(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model , int i_no) {
				logger.info("insertKyungmae.do.", locale);
				HttpSession session = request.getSession();
				MemberDto loginMemberDto = (MemberDto) session.getAttribute("loginMember");
				
				
				ItemDto itemDto = itemService.selectItem(i_no);
				
				//원래 가격
				int beforePrice = itemDto.getI_price();
				
				//원래가격 가격에 따른 추가 금액 설정
				
				int plusPrice=plusPrice(beforePrice);
	
				int i_price = beforePrice + plusPrice;
				itemDto.setI_price(i_price)
						.setM_no(0);
				
				
				if(itemService.updateItem(itemDto)) {
					Calendar cal= Calendar.getInstance();
					cal.add(Calendar.DATE, 7);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String strDate = sdf.format(cal.getTime());

					String k_regdate = strDate;
				
				KyungmaeDto kyungmaeDto = new KyungmaeDto();
					kyungmaeDto.setI_no(itemDto.getI_no())
							   .setI_name(itemDto.getI_name())
							   .setI_img(itemDto.getI_img())
							   .setK_first_price(i_price)
							   .setK_first_no(loginMemberDto.getM_no())
							   .setK_first_name(loginMemberDto.getM_name())
							   .setK_second_price(beforePrice)
							   .setK_second_no(0)
							   .setK_second_name("최초입찰")
							   .setK_regdate(k_regdate)
							   .setK_state("진행중");
					
					if(kyungmaeService.insertKyungmae(kyungmaeDto)) {
					 System.out.println("경매등록");
				 }else {
					 System.out.println("경매등록 error");
				 }
				
				}else {
					System.out.println("아이템 가격변경 error");
				}
				return "Kyungmae/successKyungmaeForm";
				
			}
		//진행중인 경매 참여
		@RequestMapping(value = "/updateKyungmae.do",  method = {RequestMethod.POST, RequestMethod.GET})
		public String updateKyungmae(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,int beforePrice,int nextPrice ,int k_no, int i_no) {
		logger.info("updateKyungmae.do.", locale);
		HttpSession session = request.getSession();
		MemberDto loginMemberDto = (MemberDto) session.getAttribute("loginMember");
		
		ItemDto itemDto = itemService.selectItem(i_no);
		//nextPrice = beforePrice + plusPrice
		itemDto.setI_price(nextPrice);
		
		if(itemService.updateItem(itemDto)) {
			KyungmaeDto kyungmaeDto = kyungmaeService.selectK_noKyungmae(k_no);
			int k_second_price =kyungmaeDto.getK_first_price();
			int k_second_no = kyungmaeDto.getK_first_no();
			String k_second_name = kyungmaeDto.getK_first_name();
			
			kyungmaeDto.setK_first_price(itemDto.getI_price())
						.setK_first_no(loginMemberDto.getM_no())
						.setK_first_name(loginMemberDto.getM_name())
						 .setK_second_price(k_second_price)
						 .setK_second_no(k_second_no)
						 .setK_second_name(k_second_name);
						  
			kyungmaeService.updateKyungmae(kyungmaeDto);

		}	
		return "Kyungmae/successKyungmaeForm";	
		}
	//경매 시간 다 됬을 경우 상태를 "종료"로 변경
	@RequestMapping(value = "/updateKyungmaeEnd.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public void updateKyungmaeEnd(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,int k_no, int i_no) {
    logger.info("updateKyungmaeEnd.do.", locale);
    ItemDto itemDto = itemService.selectItem(i_no);
    	KyungmaeDto  kyungmaeDto = kyungmaeService.selectK_noKyungmae(k_no);
    	int m_no = kyungmaeDto.getK_first_no();
    	itemDto.setM_no(m_no);
    	kyungmaeDto.setK_state("종료");
    	if(itemService.updateItem(itemDto)) {
    		kyungmaeService.updateKyungmae(kyungmaeDto);
    	}
	
	}
	//  *"진행중"인 경매  목록
	@RequestMapping(value = "/kyungmaelist.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String kyungmaelist(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
	logger.info("kyungmaelist.do.", locale);
		
	String colvalue ="진행중";
	String COLNAME = "K_STATE";
	List<KyungmaeDto> kyungmaeList = kyungmaeService.selectKyungmaeList(COLNAME,colvalue); 
			
	request.setAttribute("kyungmaeList", kyungmaeList);
	return "kyungmae/kyungmaeList";
	}
	// [매니저 페이지 합칠것] *전체 경매목록 
	@RequestMapping(value = "/managerKyungmaeList_All.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String managerKyungmaeList_All(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
    logger.info("managerKyungmaeList_All.do.", locale);
	List<KyungmaeDto> kyungmaeList = kyungmaeService.selectKyungmaeList(); 
	
	request.setAttribute("kyungmaeList", kyungmaeList);
	return "manager/kyungmaeList_All";
	}
	
	// [매니저 페이지 합칠것] *오늘종료되는 경매  목록
	@RequestMapping(value = "/managerKyungmaeList_End.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String managerKyungmaeList_End(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
	logger.info("managerKyungmaeList_End.do.", locale);
	Calendar cal= Calendar.getInstance();

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String k_regdate  = sdf.format(cal.getTime());
	
	String colvalue =k_regdate;
	String COLNAME = "K_REGDATE";
	List<KyungmaeDto> kyungmaeList = kyungmaeService.selectKyungmaeList(COLNAME,colvalue); 
		
	request.setAttribute("kyungmaeList", kyungmaeList);
	return "manager/managerKyungmaeList_End";
	}
	
	// [매니저 페이지 합칠것] *"진행중"인 경매  목록
	@RequestMapping(value = "/managerKyungmaeList_Ing.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String managerKyungmaeList_Ing(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
	logger.info("managerKyungmaeList_Ing.do.", locale);
		
	String colvalue ="진행중";
	String COLNAME = "K_STATE";
	List<KyungmaeDto> kyungmaeList = kyungmaeService.selectKyungmaeList(COLNAME,colvalue); 
			
	request.setAttribute("kyungmaeList", kyungmaeList);
	return "manager/managerKyungmaeList_Ing";
	}
	// [매니저 페이지 합칠것] * 경매  삭제
	@RequestMapping(value = "/managerDeleteKyungmae.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String managerDeleteKyungmae(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,int k_no) {
	logger.info("managerDeleteKyungmae.do.", locale);
			
	if(kyungmaeService.deleteKyungmae(k_no)) {
		
	}
	
	
				
		//redirect 경로 재설정 필요 
		return "manager/managerKyungmaeList_Ing";
		}
	
	
			//원래가격 가격에 따른 추가 금액 설정
			public int plusPrice(int beforePrice) {
				int plusPrice = 0;
				
				int beforePriceSize = (beforePrice+"").length();
				//천원대 1,000~9,999일때 
				if(beforePriceSize==4 || beforePriceSize<4) {
					plusPrice =500;
				}
				//만원대 / 10,000~99,999 일때 
				else if(beforePriceSize==5) {
					plusPrice = 5000;
				}
				//십만원대 / 100,000~999,999 일때
				else if(beforePriceSize==6) {
					plusPrice = 50000;
				}
				//백만원대 / 1,000,000~9,999,999 일때
				else if(beforePriceSize==7) {
					plusPrice = 100000;
				}
				//천만원대 / 10,000,000~99,999,999 일때
				else if(beforePriceSize==8) {
					plusPrice = 500000;
				}
				//일억대 이상 / 100,000,000~ 일때
				else if(beforePriceSize>=9) {
					plusPrice = 1000000;
				}
				
				return plusPrice;
			}
			
			
			
			
}//Controller End
