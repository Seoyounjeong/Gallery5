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

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
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
 * fileupload 경로 설정 주의사항 - 
 * 247 작품올리기 	D:/PROJECT/itemupload 저장 		-> 저장 후 사진 복사해서 프로젝트의 itemupload파일로 넣어주어야함 
 * 352 전시올리기 	D:/PROJECT/exhibitionupload 저장 -> 저장 후 사진 복사해서 프로젝트의 exhibitionupload파일로 넣어주어야함 
 * 490 전시 수정 	D:/PROJECT/exhibitionupload 저장 -> 저장 후 사진 복사해서 프로젝트의 exhibitionupload파일로 넣어주어야함 
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
	
	@Autowired 
	private JavaMailSenderImpl mailSender;

	
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
				
		//1절대경로 D:/PROJECT/itemupload 로 저장 한다 
		//2절대경로에 저장되어있기 때문에 자신이 올린 파일을 직접 maven project itemupload 폴더에 넣어주어야한다
		
		File f = new File("D:/PROJECT/itemupload/"+stored_fname);
		
		
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
		List<ItemDto> myItemList =itemService.selectA_noItemList(a_no,1);
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
			List<ItemDto> myItemList =itemService.selectA_noItemList(a_no,0);
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
		
		//파일객체 구하기	C:\Users\hk-edu\git\Gallery5\Gallery5\src\main\webapp\exhibitionupload
		File f = new File("D:/PROJECT/exhibitionupload/"+stored_fname);
		
	
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
					return "redirect:myExhibitionList.do";  
				}
			}else {
				System.out.println("insertExhibition error");
				return "error";
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} 
		
		request.setAttribute("a_no", a_no);
		return "redirect:myExhibitionList.do";  
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
	public String myExhibitionlist(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
		logger.info("myExhibitionList.do.", locale);
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("loginMember");
		int a_no =memberDto.getM_no();
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
		List<ItemDto> myitemList = itemService.selectA_noItemList(a_no,0);
		model.addAttribute("exhibitionDto", exhibitionDto);
		model.addAttribute("itemList" ,itemList);
		model.addAttribute("myitemList", myitemList);
			return "Exhibition/updateExhibitionForm";
		}	
	//전시 수정
	@RequestMapping(value = "/updateExhibition.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String updateExhibition(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,int[] Updatei_no,int[] Deletei_no) {
		logger.info("updateExhibition.do.", locale);
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;

		ExhibitionDto exhibitionDto = new ExhibitionDto();

		MultipartFile filename = multi.getFile("filename");

		int a_no = Integer.parseInt(request.getParameter("a_no"));
		System.out.println("filename ["+filename+"]");
		System.out.println("filename Name =["+filename.getOriginalFilename()+"]");		
		if(!filename.getOriginalFilename().equals("")) {
			System.out.println("11");
		
		
		MultipartFile  multifile = multi.getFile("filename");
		

		
			//요청파일 가져오기
			
				
			
			String origin_fname=multifile.getOriginalFilename();
			
			String creatUUID = UUID.randomUUID().toString().replaceAll("-", "");
			
			String stored_fname = creatUUID +origin_fname.substring(origin_fname.lastIndexOf("."));
			
			
			//파일객체 구하기 C:\Users\hk-edu\git\Gallery5\Gallery5\src\main\webapp\exhibitionupload
			
			
			File f = new File("D:/PROJECT/itemupload/"+stored_fname);
	
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
						return "Kyungmae/endKyungmaeForm";
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
					 String from = "gallerytest4@naver.com";
						String to = "gallerytest4@naver.com";
						String title= "[방구석갤러리]경매등록 발생";
						String msg ="경매가 등록되었습니다";
						SendMail(from, to, title, msg);
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
	public String updateKyungmaeEnd(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,int k_no, int i_no, String from) {
    logger.info("updateKyungmaeEnd.do.", locale);
    ItemDto itemDto = itemService.selectItem(i_no);
    	KyungmaeDto  kyungmaeDto = kyungmaeService.selectK_noKyungmae(k_no);
    	int m_no = kyungmaeDto.getK_first_no();
    	itemDto.setM_no(m_no);
    	kyungmaeDto.setK_state("종료");
    	if(from.equals("pop")) {
    		if(itemService.updateItem(itemDto)) {
    			if(kyungmaeService.updateKyungmae(kyungmaeDto)) {
    				
    				
    				
    				
    				
    			}else {
    				System.out.println("[pop]pupdateKyungmaeEnd_경매 업데이트 error");
    			}
    		}else {
    			System.out.println("[pop]updateKyungmaeEnd_아이템 업데이트 error");
    		}
    		return "Kyungmae/endKyungmaeForm";
    	}else {
    		if(itemService.updateItem(itemDto)) {
    			if(kyungmaeService.updateKyungmae(kyungmaeDto)) {
    				
    			}else {
    				System.out.println("updateKyungmaeEnd_경매 업데이트 error");
    			}
    		}else {
    			System.out.println("updateKyungmaeEnd_아이템 업데이트 error");
    		}
    		return "redirect:kyungmaelist.do";
    	}
	}
	
	
	//  *"진행중"인 경매  목록
	@RequestMapping(value = "/kyungmaelist.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String kyungmaelist(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
	logger.info("kyungmaelist.do.", locale);
		
	String k_state ="진행중";

	List<KyungmaeDto> onKyungmaeList = kyungmaeService.selectKyungmaeList(k_state); 
	Calendar cal= Calendar.getInstance();

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String k_regdate  = sdf.format(cal.getTime());
	

	List<KyungmaeDto> nowKyungmaeList = kyungmaeService.selectKyungmaeList(k_regdate);
	System.out.println("nowKyungmaeList.length : ["+nowKyungmaeList.size()+"]");
	request.setAttribute("nowKyungmaeList", nowKyungmaeList);
	request.setAttribute("onKyungmaeList", onKyungmaeList);
	return "Kyungmae/kyungmaeList";
	}
	
	
	//메일 발송 이벤트 
	public void SendMail(final String from , final String to , final String title ,final String msg) {
							//보내는메일주소			받는메일주소				제목				내용
		final MimeMessagePreparator preparator = new MimeMessagePreparator() { 
			@Override public void prepare(MimeMessage mimeMessage) throws Exception 
		{ final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
			String Message =SendMailForm(msg);
			helper.setFrom(from); 
			helper.setTo(to);
			helper.setSubject(title); 
			helper.setText(Message, true); }
			

		 }; 
		 mailSender.send(preparator); 
		 System.out.println("메일 발신 성공");

	}
	//메일 발송폼 
	public String SendMailForm(String msg) {
		String sendMailForm="<link href=\"https://fonts.googleapis.com/css?family=Jua\" rel=\"stylesheet\"> " + 
				" <link href=\"https://fonts.googleapis.com/css?family=Nanum+Brush+Script\" rel=\"stylesheet\"> " + 
				 "<div style=\"text-align: center; font-family: 'Jua', sans-serif; margin-top: 10%;\">\n" + 
				"    <h2>안녕하세요 <span style=\"font-family: 'Nanum Brush Script', cursive;\">[ 방구석갤러리 ]</span>입니다</h2> " + 
				"    <div style=\"text-align: center; font-family: 'Jua', sans-serif;\"> " + 				
				"        <p>"+msg+"</p> " + 
				"        <a href=\"http:// 192.168.3.106:8888/gallery/\" style=\"text-decoration: none; color: plum;\">확인하기</a> " + 
				"    </div> " + 
				" </div> ";
		
		
		return sendMailForm;
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
