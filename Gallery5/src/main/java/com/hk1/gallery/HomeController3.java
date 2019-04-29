package com.hk1.gallery;

import java.lang.ProcessBuilder.Redirect;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk1.gallery.dao.IRequestDao;
import com.hk1.gallery.dto.ArtistDto;
import com.hk1.gallery.dto.ExhibitionDto;
import com.hk1.gallery.dto.ItemDto;
import com.hk1.gallery.dto.MemberDto;
import com.hk1.gallery.dto.RequestDto;
import com.hk1.gallery.service.ArtistService;
import com.hk1.gallery.service.IArtistService;
import com.hk1.gallery.service.IExhibitionService;
import com.hk1.gallery.service.IItemService;
import com.hk1.gallery.service.IMemberService;
import com.hk1.gallery.service.IRequestService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController3 {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController3.class);
	
	@Autowired
	private IArtistService artistService;
	@Autowired
	private IRequestService requestService;
	@Autowired
	private IMemberService memberSerive;
	@Autowired
	private IExhibitionService exhibitionService;
	@Autowired
	private IItemService itemService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//작가 리스트
	@RequestMapping(value = "/artistlist.do", method = RequestMethod.GET)
	public String artistlist(Locale locale, Model model) {
		logger.info("작가목록{}.", locale);
		
		List<ArtistDto> list = artistService.selectArtistListImg();
		
		System.out.println("what is list = " +list);
		model.addAttribute("list",list);
		
		return "artist/selectArtistList";
	}
	
	//작가번호에 따라 상세보기
	@RequestMapping(value = "/getartist.do", method = RequestMethod.GET)
	public String getartist(Locale locale, Model model, int a_no) {
		logger.info("작가상세보기{}.", locale);
		
		ArtistDto artistDto  = new ArtistDto();
		artistDto = artistService.selectArtist(a_no);
		System.out.println("what is artistDto = " +artistDto);
		
		model.addAttribute("artistDto",artistDto);
		
		//상세보기 안의 작가번호로 작품
		List<ItemDto> itemDto = itemService.selectA_noItemList(a_no);
		model.addAttribute("itemDto", itemDto);
		//상세보기 안의 작가번호로 작품
		List<ExhibitionDto> exhibitionDto = exhibitionService.selectExhibitionList(a_no);
		model.addAttribute("exhibitionDto", exhibitionDto);
	return "artist/detailArtist";
	}
	
	//작가상태에 따른 보기
	@RequestMapping(value = "/artiststate.do", method = RequestMethod.GET)
	public String artiststate(Locale locale, Model model, int a_state) {
		logger.info("작가상태보기{}.", locale);
		
		List<ArtistDto> list  = artistService.selectArtistList(a_state);
		model.addAttribute("list",list);
		
		
	return "artist/artiststate";
	}
	//작가 등록폼 으로 이동
	@RequestMapping(value = "/insertartistform.do", method = RequestMethod.GET)
	public String insertartistform(Locale locale, Model model) {
		logger.info("작가등록폼 이동하기{}.", locale);
		
	return "artist/insertArtistForm";
	}
	
	//작가신청
	@RequestMapping(value = "/insertartist.do", method = RequestMethod.GET)
	public String insertartist(HttpServletRequest request,Locale locale, Model model, String[] solo, String[] squard, String[] career,
			int a_state, int a_no, String a_name, MemberDto memberDto) {
		logger.info("작가등록하기{}.", locale);
		System.out.println("신청dtdo = "+memberDto);
		
	/*	HttpSession session = request.getSession();
		MemberDto loginmember =  (MemberDto) session.getAttribute("loginMember");
			loginmember.setM_grade(4);*/
		
		//배열 값으로 받아서 for문을 돌려서 String으로 합쳐준다(구분자를 추가해서 구분)
		String soloB = "" ;
		String squardB="";
		String careerB="";
		for(String soloA : solo) {
			soloB += (soloA+"<br>");
		}
		
		for(String soloA : squard) {
			squardB += (soloA+"<br>");
		}
		
		for(String soloA : career) {
			careerB += (soloA+"<br>");
		}
		
		System.out.println("soloB="+soloB+"squardB="+squardB+"careerB="+careerB);
		System.out.println(a_state);
		System.out.println(a_no);
		System.out.println(a_name);
		
		
		boolean isS = artistService.insertArtist(new ArtistDto().setA_solo(soloB)
																.setA_Squard(squardB)																.setA_career(careerB)
																.setA_name(a_name)
																.setA_no(a_no)
																.setA_state(a_state));
		
		boolean iss2 = memberSerive.updateMember(memberDto);
		System.out.println(iss2);
		HttpSession session = request.getSession();
		session.removeAttribute("loginMember");
		session.setAttribute("loginMember", memberDto);
				
				
		
		if (isS) {
			
			return "redirect:privatemain.do";
		}else {
			return "redirect:insertartistform.do";
		}
		
	}
	//작가 삭제하기
	@RequestMapping(value = "/deleteartist.do", method = RequestMethod.GET)
	public String deleteartist(Locale locale, Model model, int a_no) {
		logger.info("작가삭제 하기{}.", locale);
		
		boolean isS = artistService.deleteArtist(a_no);
		
		if(isS) {
			return "redirect:artistlist.do";
		}else {
			return "artist/selectArtist";
		}
	
	}
	
	//메시지------------------------------------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value = "/message.do", method = RequestMethod.GET)
	public String message(Locale locale, Model model) {
		logger.info("메시지창 이동하기{}.", locale);
		
		return "request/request";
	
	}
	
	//메시지 입력 폼으로 가기
	
	@RequestMapping(value = "/insertrequestform.do", method = RequestMethod.GET)
	public String insertrequestform(Locale locale, Model model) {
		logger.info("메시지보내기창 이동하기{}.", locale);
		
		return "request/insertrequestform";
	
	}
	
	
	//메시지 보내기(insert)
	//resoponsebody = 다시 들어온 곳으로 응답한다. 여기서는 close값을 보내준다
		@ResponseBody
		@RequestMapping(value = "/insertrequest.do", method = RequestMethod.POST)
		public String insertrequest(Locale locale, Model model, int r_send, String r_sendname, int r_receive, String r_receivename, String r_title, String r_content) {
			logger.info("메시지보내기(db에 집어넣기){}.", locale);
			
			System.out.println(r_send);
			System.out.println(r_sendname);
			System.out.println(r_receive);
			System.out.println(r_receivename);
			System.out.println(r_title);
			System.out.println(r_content);
			
			requestService.insertRequest(new RequestDto().setR_send(r_send)
																		.setR_sendname(r_sendname)
																		.setR_receive(r_receive)
																		.setR_receivename(r_receivename)
																		.setR_title(r_title)
																		.setR_content(r_content));
			String close = "<script>window.close();</script>";
			return close;
			
			/*if (isS) {
				return "redirect:message.do";
			}else {
				return "redirect:insertrequestform.do";
			}
			*/
			
		
				
		}
		//받은메시지함 페이지
		@RequestMapping(value = "/selectRequestListReceive.do", method = RequestMethod.GET)
		public String selectRequestListReceive(Locale locale, Model model , int r_receive ) {
			logger.info("받은 메시지함{}.", locale);
			
			List<RequestDto> list = requestService.selectR_receiveRequestList(r_receive);
			System.out.println("list?="+list);
			model.addAttribute("list", list);
			
			return "request/selectRequestListReceive";
			
		}
			
			
			
		//보낸메시지함 페이지
		@RequestMapping(value = "/selectRequestListSend.do", method = RequestMethod.GET)
		public String selectRequestListSend(Locale locale, Model model, int r_send) {
			logger.info("보낸 메시지함{}.", locale);
			
			List<RequestDto> list  = requestService.selectR_sendRequestList(r_send);
			model.addAttribute("list", list);
			
			return "request/selectRequestListSend";
		
		}
		
		
	//받은메시지 함 클릭시 팝업창
			@RequestMapping(value = "/updateRequestForm.do", method = RequestMethod.GET)
		public String updateRequestForm(Locale locale, Model model, int r_no) {
			logger.info("받은메시지함 창{}.", locale);
			
			RequestDto requestDto = new RequestDto();
			
			requestDto = requestService.selectRequest(r_no);
			model.addAttribute("requestDto", requestDto);
			
			
			return "request/updateRequestForm";
		
		}
			/*받은메세지함 상태변화*/
			@ResponseBody
			@RequestMapping(value = "/updateRequest.do", method = RequestMethod.GET)
			public String updateRequest(Locale locale, Model model, RequestDto dto) {
				logger.info("받은메시지상태 수정{}.", locale);
				
				/*boolean isS= */requestService.updateRequest(dto);
				
				String close = "<script>opener.parent.location.reload();"//팝업 부모창 새로고침 실행해기,
						+ "window.close();</script>";
				return close;
				/*깜박거림*/
			/*	if (isS) {
					return "redirect:selectRequestListReceive.do?r_receive="+dto.getR_receive();
				}
				
				return "redirect:updateRequest.do";
				*/
			
			}
			//보낸메시지함 클릭시 상태보기
			@RequestMapping(value = "/selectRequestForm.do", method = RequestMethod.GET)
			public String selectRequestForm(Locale locale, Model model, int r_no) {
				logger.info("보낸메시지함 상태보기{}.", locale);
				
				RequestDto requestDto = new RequestDto();
				requestDto = requestService.selectRequest(r_no);
				
				model.addAttribute("requestDto", requestDto);
				System.out.println("승낙승낙"+requestDto);
				
				
				return "request/selectRequestForm";
				
			
			}
			//메시지 지우기
			@RequestMapping(value = "/deleteRequest.do", method = RequestMethod.GET)
			public String deleteRequest(Locale locale, Model model, int r_no) {
				logger.info("메시지 지우기{}.", locale);
					
				boolean isS = requestService.deleteRequest(r_no);
				
				if (isS) {
					return "redirect:message.do";
					
				}else{
					return "redirect:aritistlist.do";
				}
				
				
				
			
			}
	
	
}
