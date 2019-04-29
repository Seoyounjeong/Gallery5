package com.hk1.gallery;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.hk1.gallery.dto.ArtistDto;
import com.hk1.gallery.dto.CallendarDto;
import com.hk1.gallery.dto.DabgeulDto;
import com.hk1.gallery.dto.ExhibitionDto;
import com.hk1.gallery.dto.GalleryDto;
import com.hk1.gallery.dto.ItemDto;
import com.hk1.gallery.dto.MemberDto;
import com.hk1.gallery.dto.RequestDto;
import com.hk1.gallery.service.IArtistService;
import com.hk1.gallery.service.ICallendarService;
import com.hk1.gallery.service.IDabgeulService;
import com.hk1.gallery.service.IExhibitionService;
import com.hk1.gallery.service.IGalleryService;
import com.hk1.gallery.service.IItemService;
import com.hk1.gallery.service.IMemberService;
import com.hk1.gallery.service.IRequestService;


//url앞에 manager붙이기 

@Controller
public class HomeController2 {

	private static final Logger logger = LoggerFactory.getLogger(HomeController2.class);

	@Autowired
	private IMemberService memberService;
	@Autowired
	private IArtistService artistService;
	@Autowired
	private IGalleryService galleryService;
	@Autowired
	private IRequestService requestService;
	@Autowired
	private IExhibitionService exhibitionService;
	@Autowired
	private IDabgeulService dabgeulService;
	@Autowired
	private IItemService itemService;
	@Autowired
	private ICallendarService callendarService;
	
	
	

	@RequestMapping(value = "/managermain.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );

		return "manager/home";
	}

	//member
	@RequestMapping(value = "/managerselectMemberList.do", method = RequestMethod.GET)
	public String selectMemberList(Locale locale, Model model) {
		logger.info("회원목록보기 {}.", locale);

		List<MemberDto>list=memberService.selectMemberList();
		model.addAttribute("list",list);

		return "manager/member/memberlist";		
	}

	//
	@RequestMapping(value = "/managerinsertmemberform.do", method = RequestMethod.GET)
	public String insertform(Locale locale, Model model,MemberDto memberDto) {
		logger.info("회원 추가폼이동 {}.", locale);

		return "manager/member/memberinsert";
	}
	//
	@RequestMapping(value = "/managerinsertMember.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertMember(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,MemberDto memberDto) {
		logger.info("회원 추가하기 {}.", locale);
		System.out.println(memberDto.getM_name());
		boolean isS=memberService.insertMember(memberDto);
		if(isS) {
			return "redirect:managerselectMemberList.do";
		}else {//error아직
			model.addAttribute("msg","회원추가 실패");
			return "error";
		}
	}
	//상세보기
	@RequestMapping(value = "/managerselectMember1.do", method = RequestMethod.GET)
	public String selectMember(Locale locale, Model model, int m_no) {
		logger.info("회원상세보기 {}.", locale);

		MemberDto memberDto=memberService.selectMember(m_no);
		model.addAttribute("memberDto", memberDto);

		return "manager/member/memberdetail";
	}

	@RequestMapping(value = "/managerupdateform.do", method = RequestMethod.GET)
	public String updateform(Locale locale, Model model, int m_no) {
		logger.info("회원정보수정폼이동 {}.", locale);

		MemberDto memberDto=memberService.selectMember(m_no);
		model.addAttribute("memberDto",memberDto);

		return "manager/member/memberupdate";		
	}

	@RequestMapping(value = "/managerupdateMember.do", method = RequestMethod.POST)
	public String updateMember(Locale locale, Model model, MemberDto memberDto) {
		logger.info("회원정보수정 {}.", locale);
		boolean isS=memberService.updateMember(memberDto);
		if(isS) {
			return "redirect:managerselectMember1.do?m_no="+memberDto.getM_no();
		}else {
			model.addAttribute("msg", "글추가 실패");
			return "error";	
		}
	}

	@RequestMapping(value = "/selectMember2.do", method = RequestMethod.GET)
	public String selectMember(Locale locale, Model model, String m_id) {
		logger.info("회원목록보기 {}.", locale);
		MemberDto memberDto=memberService.selectMember(m_id);
		model.addAttribute("memberDto", memberDto);
		return "manager/member/memberlist";
	}
	//
	@RequestMapping(value = "/managerdeleteMember.do", method = RequestMethod.GET)
	public String deleteMember(Locale locale, Model model, MemberDto memberDto, int m_no) {
		logger.info("회원삭제 {}.", locale);

		boolean isS=memberService.deleteMember(memberDto.getM_no());
		if(isS) {
			return "redirect:managerselectMemberList.do";
		}else {//error하셈
			model.addAttribute("msg", "글삭제 실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/managerselectCheckMemberList.do", method = RequestMethod.GET)
	public String selectCheckMemberList(Locale locale, Model model) {
		logger.info("미승인회원목록보기 {}.", locale);
		
		List<MemberDto>list=memberService.selectCheckMemberList();
		model.addAttribute("list",list);

		return "manager/member/membercheck";		
	}
	
	
	//member
	
	
	//artist
	@RequestMapping(value = "/managerselectArtistList.do", method = RequestMethod.GET)
	public String selectAritistList(Locale locale, Model model) {
		logger.info("작가목록보기 {}.", locale);
		System.out.println(locale);
		System.out.println("model:"+model);
		List<ArtistDto> list = artistService.selectArtistList();
		
		model.addAttribute("list",list);
		return "manager/artist/artistlist";		
	}

	@RequestMapping(value = "/managerinsertArtistform.do", method = RequestMethod.GET)
	public String insertartistform(Locale locale, Model model,ArtistDto artistDto) {
		logger.info("작가 추가폼이동 {}.", locale);

		return "manager/artist/artistinsert";
	}
	
	@RequestMapping(value = "/managerinsertArtist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertArtist(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,ArtistDto artistDto) {
		logger.info("작가 추가하기 {}.", locale);
		System.out.println(artistDto);

		//selectArtistNo -> 현재 테이블의 A_NO MAX 값
		//artistDto.setA_no(MAX+1);
		//각 메뉴에서 메인메뉴로 가기
		//추가이 빈값 허용 안되도록 -> 각 테이블 PK 생성
		//딜리트와 업데이트에서 PK값만 적용되도록
		//디비 Not Null 체크 추가
		//where A_STATE not in (4,7,9)
		
		boolean isS=artistService.insertArtist(artistDto);
		if(isS) {
			return "redirect:managerselectArtistList.do";
		}else {//error아직
			model.addAttribute("msg","작가추가 실패");
			return "error";
		}
	}

	@RequestMapping(value = "/managerselectArtist.do", method = RequestMethod.GET)
	public String selectArtist(Locale locale, Model model, int a_no) {
		logger.info("작가상세보기 {}.", locale);
		System.out.println(a_no);
		ArtistDto artistDto=artistService.selectArtist(a_no);
		model.addAttribute("artistDto", artistDto);

		return "manager/artist/artistdetail";
	}

	@RequestMapping(value = "/managerartistupdateform.do", method = RequestMethod.GET)
	public String artistupdateform(Locale locale, Model model, int a_no) {
		logger.info("작가정보수정폼이동 {}.", locale);
		System.out.println(a_no);
		ArtistDto artistDto=artistService.selectArtist(a_no);
		model.addAttribute("artistDto",artistDto);

		return "manager/artist/artistupdate";		
	}
 
	@RequestMapping(value = "/managerupdateArtist.do", method = RequestMethod.POST)
	public String updateArtist(Locale locale, Model model, ArtistDto artistDto) {
		logger.info("작가정보수정 {}.", locale);
		boolean isS=artistService.updateArtist(artistDto);
		if(isS) {
			return "redirect:managerselectArtist.do?a_no="+artistDto.getA_no();
		}else {
			model.addAttribute("msg", "작가추가 실패");
			return "error";	
		}
	}

	@RequestMapping(value = "/managerdeleteArtist.do", method = RequestMethod.GET)
	public String deleteArtist(Locale locale, Model model, ArtistDto artistDto, int a_no) {
		logger.info("작가삭제 {}.", locale);

		boolean isS=artistService.deleteArtist(artistDto.getA_no());
		if(isS) {
			return "redirect:managerselectArtistList.do";
		}else {//error하셈
			model.addAttribute("msg", "글삭제 실패");
			return "error";
		}
	}

	@RequestMapping(value = "/managerselectyetArtistList.do", method = RequestMethod.GET)
	public String selectAritistList1(Locale locale, Model model, String ya_state) {
		//승인안된 작가 목록 보기
		logger.info("승인안된작가 들 목록보기 {}.", locale);
		System.out.println(ya_state);
		String[] ya = ya_state.split(",");
		List<ArtistDto> list = new ArrayList<ArtistDto>();
		for(int i = 0 ; i < ya.length ; i++) {
			Iterator<ArtistDto> it = artistService.selectArtistList(Integer.parseInt(ya[i])).iterator();
			while(it.hasNext()) {
				list.add((ArtistDto) it.next());
			}
		}
		model.addAttribute("list",list);

		return "manager/artist/yetartistlist";		
	}


	//gallery
	@RequestMapping(value = "/managerselectGalleryList.do", method = RequestMethod.GET)
	public String selectGalleryList(Locale locale, Model model) {
		logger.info("갤러리목록보기 {}.", locale);

		List<GalleryDto>list=galleryService.selectGalleryList();

		model.addAttribute("list",list);
		return "manager/gallery/gallerylist";		
	}


	@RequestMapping(value = "/managerinsertGalleryform.do", method = RequestMethod.GET)
	public String insertgalleryform(Locale locale, Model model,ArtistDto artistDto) {
		logger.info("갤러리 추가폼이동 {}.", locale);

		return "manager/gallery/galleryinsert";
	}

	@RequestMapping(value = "/managerinsertGallery.do", method = RequestMethod.POST)
	public String insertGallery(MultipartHttpServletRequest mtfRequest,HttpServletRequest request, Locale locale, Model model,GalleryDto galleryDto) {
		logger.info("갤러리 추가하기 {}.", locale);
		System.out.println(request);
	
		//int g_no=Integer.parseInt(request.getParameter("g_no"));
		int m_no=Integer.parseInt(request.getParameter("m_no"));
		String g_name=request.getParameter("g_name");
		String g_adress=request.getParameter("g_adress");
		String g_tel=request.getParameter("g_tel");
		String g_intro=request.getParameter("g_intro");
		int g_state=Integer.parseInt(request.getParameter("g_state"));
		

		List<MultipartFile> fileList = mtfRequest.getFiles("file");

		
		String path = "C:/Users/itcam/git/galleryweb/Gallery3/src/main/webapp/uploadFiles/";
		//C:\Users\itcam\git\gallery\Gallery\src\main\webapp\ //uploadFiles
						//C:/Users/itcam/git/gallery/Gallery/src/main/webapp/uploadFiles
		 for (int i = 0; i < fileList.size(); i++) {
	         //원래이름
	         String imgdbname= fileList.get(i).getOriginalFilename();
	         
	         
	         System.out.println(imgdbname);
	         
	        // String stored_fname= imgdbname.substring(imgdbname.lastIndexOf("."));

	         
	         String stored_fname= createUUId()
	                 +(imgdbname.substring(imgdbname.lastIndexOf(".")));
	         
	         String saveDirectory = path +stored_fname;
	         
	         
	         try {
	            
	            fileList.get(i).transferTo(new File(saveDirectory));//파일객체의 경로대로 업로드 실행
	            
	         } catch (IllegalStateException e) {
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         
	         if (i==0) {
	             galleryDto.setG_img1(stored_fname);
	          }else if (i==1) {
	             galleryDto.setG_img2(stored_fname);
	          }else if (i==2) {
	             galleryDto.setG_img3(stored_fname);
	          }else if (i==3) {
	             galleryDto.setG_img4(stored_fname);
	          }
	       }
	       
	       galleryDto.setG_name(g_name);
	       galleryDto.setG_intro(g_intro);
	       galleryDto.setG_adress(g_adress);
	       galleryDto.setG_tel(g_tel);
	       //galleryDto.setG_no(g_no);
	       galleryDto.setM_no(m_no);
	       galleryDto.setG_state(g_state);
	            
	       boolean isS = galleryService.insertGallery(galleryDto);

	       if(isS) {
	         return "redirect:managerselectGalleryList.do";
		
		 }else {
			 model.addAttribute("msg", "글삭제 실패");
				return "error";
		 }

	}

	private String createUUId() {
		
		String uuid =UUID.randomUUID()+"";
		
		String name=uuid.replace("-", "");
		
	
		return name;
		
	}

	
	@RequestMapping(value = "/managerselectGallery.do", method = RequestMethod.GET)
	public String selectGallery(Locale locale, Model model, int g_no) {
		logger.info("갤러리상세보기 {}.", locale);

		GalleryDto galleryDto=galleryService.selectGallery(g_no);
		model.addAttribute("galleryDto", galleryDto);

		return "manager/gallery/gallerydetail";
	}

	@RequestMapping(value = "/managergalleryupdateform.do", method = RequestMethod.GET)
	public String galleryupdateform(Locale locale, Model model, int g_no) {
		logger.info("갤러리정보수정폼이동 {}.", locale);
		System.out.println(g_no);
		GalleryDto galleryDto=galleryService.selectGallery(g_no);
		model.addAttribute("galleryDto",galleryDto);

		return "manager/gallery/galleryupdate";		
	}
	
	@RequestMapping(value = "/managerupdateGallery.do", method = RequestMethod.POST)
	public String updateGallery(MultipartHttpServletRequest mtfRequest,HttpServletRequest request,Locale locale, Model model) {
		logger.info("갤러리정보수정 {}.", locale);
		
		GalleryDto galleryDto = new GalleryDto();
		
		String g_name = mtfRequest.getParameter("g_name");
		String g_intro = mtfRequest.getParameter("g_intro");
		String g_adress = mtfRequest.getParameter("g_adress");
		int g_no = Integer.parseInt(mtfRequest.getParameter("g_no"));
		int m_no = Integer.parseInt(mtfRequest.getParameter("m_no"));
		int g_state  = Integer.parseInt(mtfRequest.getParameter("g_state"));
		String g_tel  = mtfRequest.getParameter("g_tel");
		
		GalleryDto registeredGalleryDto=galleryService.selectGallery(g_no);
		
		galleryDto.setG_name(g_name);
		galleryDto.setG_intro(g_intro);
		galleryDto.setG_adress(g_adress);
		galleryDto.setG_no(g_no);
		galleryDto.setM_no(m_no);
		galleryDto.setG_state(g_state);
		galleryDto.setG_tel(g_tel);
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");

		
		String path = "C:/Users/itcam/git/galleryweb/Gallery3/src/main/webapp/uploadFiles/";
		
		 for (int i = 0; i < fileList.size(); i++) {
			 
	         //원래이름
	         String imgdbname= fileList.get(i).getOriginalFilename();
	         if(imgdbname.isEmpty()) {
	        	 System.out.println("값이 없음");
	        	 if (i==0) {
		             galleryDto.setG_img1(registeredGalleryDto.getG_img1());
		          }else if (i==1) {
		             galleryDto.setG_img2(registeredGalleryDto.getG_img2());
		          }else if (i==2) {
		             galleryDto.setG_img3(registeredGalleryDto.getG_img3());
		          }else if (i==3) {
		             galleryDto.setG_img4(registeredGalleryDto.getG_img4());
		          }
		          
				 continue;
			 }
	         
	         System.out.println("imgdbname :" +imgdbname);
	         
	         System.out.println(imgdbname);
	         
	        // String stored_fname= imgdbname.substring(imgdbname.lastIndexOf("."));

	         String stored_fname= createUUId()
	                 +(imgdbname.substring(imgdbname.lastIndexOf(".")));
	         
	         String saveDirectory = path +stored_fname;
	         
	         try {
	            
	            fileList.get(i).transferTo(new File(saveDirectory));//파일객체의 경로대로 업로드 실행
	            
	         } catch (IllegalStateException e) {
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         
	         if (i==0) {
	             galleryDto.setG_img1(stored_fname);
	          }else if (i==1) {
	             galleryDto.setG_img2(stored_fname);
	          }else if (i==2) {
	             galleryDto.setG_img3(stored_fname);
	          }else if (i==3) {
	             galleryDto.setG_img4(stored_fname);
	          }
	       }
	    
		 System.out.println(galleryDto.toString());
		boolean isS=galleryService.updateGallery(galleryDto);
		if(isS) {
			return "redirect:managerselectGallery.do?g_no="+galleryDto.getG_no();
		}else {
			model.addAttribute("msg", "갤러리추가 실패");
			return "error";	
		}
	}
	
	
	
	
	

	@RequestMapping(value = "/managerdeleteGallery.do", method = RequestMethod.GET)
	public String deleteGallery(Locale locale, Model model, GalleryDto galleryDto, int g_no) {
		logger.info("갤러리삭제 {}.", locale);
	

		boolean isS=galleryService.deleteGallery(galleryDto.getG_no());
		if(isS) {
			return "redirect:managerselectGalleryList.do";
		}else {//error하셈
			model.addAttribute("msg", "글삭제 실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/managerselectyetGalleryList.do", method = RequestMethod.GET)
	public String selectGalleryList1(Locale locale, Model model, String yg_state) {
		System.out.println(yg_state);
		logger.info("승인안된갤러리목록보기 {}.", locale);
		
		String[] yg=yg_state.split(",");
		List<GalleryDto>list = new ArrayList<GalleryDto>();
		for(int i=0; i<yg.length; i++) {
			Iterator<GalleryDto>it=galleryService.selectG_stateGalleryList(Integer.parseInt(yg[i])).iterator();
			while(it.hasNext()) {
				list.add((GalleryDto)it.next());
			}
		}
		
//		List<GalleryDto>list=galleryService.selectG_stateGalleryList(Integer.parseInt(yg[i])).iterator();
//		System.out.printf("list : " +list);
		model.addAttribute("list",list);

		return "manager/gallery/yetgallerylist";		
	}

	//request
	
	@RequestMapping(value = "/managerselectRequestList.do", method = RequestMethod.GET)
	public String selectRequestList(Locale locale, Model model) {
		logger.info("메시지목록보기 {}.", locale);

		List<RequestDto>list=requestService.selectRequestList();

		model.addAttribute("list",list);
		return "manager/request/requestlist";		
	}
	
	@RequestMapping(value = "/managerinsertRequestform.do", method = RequestMethod.GET)
	public String insertrequestform(Locale locale, Model model, RequestDto requestDto) {
		logger.info("메시지 추가폼이동 {}.", locale);

		return "manager/request/requestinsert";
	}

	@RequestMapping(value = "/managerinsertRequest.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertRequest(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,RequestDto requestDto) {
		logger.info("메시지 추가하기 {}.", locale);

		boolean isS=requestService.insertRequest(requestDto);
		if(isS) {
			return "redirect:managerselectRequestList.do";
		}else {//error아직
			model.addAttribute("msg","갤러리추가 실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/managerselectRequest.do", method = RequestMethod.GET)
	public String selectRequest(Locale locale, Model model, int r_no) {
		logger.info("메시지상세보기 {}.", locale);

		RequestDto requestDto=requestService.selectRequest(r_no);
		model.addAttribute("requestDto", requestDto);

		return "manager/request/requestdetail";
	}

	@RequestMapping(value = "/managerrequestupdateform.do", method = RequestMethod.GET)
	public String requestupdateform(Locale locale, Model model, int r_no) {
		logger.info("메시지정보수정폼이동 {}.", locale);

		RequestDto requestDto=requestService.selectRequest(r_no);
		model.addAttribute("requestDto",requestDto);

		return "manager/request/requestupdate";		
	}

	@RequestMapping(value = "/managerupdateRequest.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateRequest(Locale locale, Model model,RequestDto requestDto) {
		System.out.println("요기:"+requestDto.getR_no());
		logger.info("메시지정보수정 {}.", locale);
		boolean isS=requestService.updateRequest(requestDto);
		if(isS) {
			return "redirect:managerselectRequest.do?r_no="+requestDto.getR_no();
		}else {
			model.addAttribute("msg", "갤러리추가 실패");
			return "error";	
		}
	}
	
	@RequestMapping(value = "/managerdeleteRequest.do", method = RequestMethod.GET)
	public String deleteRequest(Locale locale, Model model,RequestDto requestDto, int r_no) {
		logger.info("메시지삭제 {}.", locale);

		boolean isS=requestService.deleteRequest(r_no);
		if(isS) {
			return "redirect:managerselectRequestList.do";
		}else {//error하셈
			model.addAttribute("msg", "글삭제 실패");
			return "error";
		}
	}
	
	//exhibition

	@RequestMapping(value = "/managerselectExhibitionList.do", method = RequestMethod.GET)
	public String selectExhibitionList(Locale locale, Model model) {
		logger.info("전시목록보기 {}.", locale);

		List<ExhibitionDto>list=exhibitionService.selectExhibitionList();

		model.addAttribute("list",list);
		return "manager/exhibition/exhibitionlist";		
	}
	
	@RequestMapping(value = "/managerinsertExhibitionform.do", method = RequestMethod.GET)
	public String insertexhibitionform(Locale locale, Model model,ExhibitionDto exhibitionDto) {
		logger.info("전시 추가폼이동 {}.", locale);

		return "manager/exhibition/exhibitioninsert";
	}

	@RequestMapping(value = "/managerinsertExhibition.do", method = RequestMethod.POST)
	public String insertExhibition(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
		//System.out.println(exhibitionDto);
		logger.info("전시 추가하기 {}.", locale);
		
		MultipartHttpServletRequest multi=(MultipartHttpServletRequest)request;
		//int e_no=Integer.parseInt(multi.getParameter("e_no"));
		String e_title=multi.getParameter("e_title");
		String e_explain=multi.getParameter("e_explain");
		int a_no=Integer.parseInt(multi.getParameter("a_no"));
		String a_name=multi.getParameter("a_name");
		//int e_click=Integer.parseInt(multi.getParameter("e_click"));
		
		MultipartFile multifile=multi.getFile("e_img");
		
		
		String e_img=multifile.getOriginalFilename();
		String stored_fname=createUUId()
				+(e_img.substring(e_img.lastIndexOf(".")));
		System.out.println(stored_fname);
		
		
		
		File file = new File("C:/Users/itcam/git/galleryweb/Gallery3/src/main/webapp/uploadFiles/"+stored_fname);
								
		
		
		System.out.println(file);
		try {
			multifile.transferTo(file);
		}catch(IllegalStateException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		boolean isS=exhibitionService.insertExhibition(new ExhibitionDto(0,e_title,e_explain,a_no,a_name,0,stored_fname));
		if(isS) {
			return "redirect:managerselectExhibitionList.do";
		}else {//error아직
			model.addAttribute("msg","갤러리추가 실패");
			return "error";
		
		}
	}

	
	@RequestMapping(value = "/managerselectExhibition.do", method = RequestMethod.GET)
	public String selectExhibition(Locale locale, Model model, int e_no) {
		logger.info("전시상세보기 {}.", locale);

		ExhibitionDto exhibitionDto=exhibitionService.selectExhibition(e_no);
		model.addAttribute("exhibitionDto", exhibitionDto);
		System.out.println(exhibitionDto);
		return "manager/exhibition/exhibitiondetail";
	}
	
	@RequestMapping(value = "/managerexhibitionupdateform.do", method = RequestMethod.GET)
	public String exhibitionupdateform(Locale locale, Model model, int e_no) {
		logger.info("전시정보수정폼이동 {}.", locale);

		ExhibitionDto exhibitionDto=exhibitionService.selectExhibition(e_no);
		model.addAttribute("exhibitionDto",exhibitionDto);

		return "manager/exhibition/exhibitionupdate";		
	}

	@RequestMapping(value = "/managerupdateExhibition.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateExhibition(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) {
		logger.info("전시정보수정 {}.", locale);
		
		MultipartHttpServletRequest multi=(MultipartHttpServletRequest)request;
		ExhibitionDto exhibitionDto= new ExhibitionDto();
		
		int e_no = Integer.parseInt(multi.getParameter("e_no"));
		String e_title= multi.getParameter("e_title");
		String e_explain=multi.getParameter("e_explain");
		int a_no=Integer.parseInt(multi.getParameter("a_no"));
		String a_name=multi.getParameter("a_name");
		//int e_click=Integer.parseInt(multi.getParameter("e_click"));
		
		ExhibitionDto registeredExhibitionDto = exhibitionService.selectExhibition(e_no);
		
		exhibitionDto.setE_no(e_no);
		exhibitionDto.setE_title(e_title);
		exhibitionDto.setE_explain(e_explain);
		exhibitionDto.setA_no(a_no);
		exhibitionDto.setA_name(a_name);
		//exhibitionDto.setE_click(e_click);
		
		MultipartFile multifile=multi.getFile("e_img");
		
		String e_img=multifile.getOriginalFilename();
		if(e_img.isEmpty()) {
			exhibitionDto.setE_img(registeredExhibitionDto.getE_img());
//			continue;
		}
		
		String stored_fname=createUUId()
				+(e_img.substring(e_img.lastIndexOf(".")));
		
		File file=new File("C:/Users/itcam/git/galleryweb/Gallery3/src/main/webapp/uploadFiles/"+stored_fname);
		
		try {
			multifile.transferTo(file);
	
		}catch(IllegalStateException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		exhibitionDto.setE_img(stored_fname);
		

		System.out.println(exhibitionDto.toString());
		
		
		boolean isS=exhibitionService.updateExhibition(exhibitionDto);
		if(isS) {
			return "redirect:managerselectExhibition.do?e_no="+exhibitionDto.getE_no();
		}else {
			model.addAttribute("msg", "갤러리추가 실패");
			return "error";	
		}
	}
	
	@RequestMapping(value = "/managerselectanoExhibitionList.do", method = RequestMethod.GET)
	public String selectExhibitionList(Locale locale, Model model, int a_no) {
		System.out.println(a_no);
		logger.info("작가로 전시목록보기 {}.", locale);
		
		List<ExhibitionDto>list=exhibitionService.selectExhibitionList(a_no);
		System.out.println(list);
		model.addAttribute("list",list);
		return "manager/exhibition/anoexhibitionlist";		
	}
	
	@RequestMapping(value = "/managerdeleteExhibition.do", method = RequestMethod.GET)
	public String deleteExhibition(Locale locale, Model model,ExhibitionDto exhibitionDto, int e_no) {
		logger.info("전시삭제 {}.", locale);

		boolean isS=exhibitionService.deleteExhibition(e_no);
		if(isS) {
			return "redirect:managerselectExhibitionList.do";
		}else {//error하셈
			model.addAttribute("msg", "글삭제 실패");
			return "error";
		}
	}
	
	
	//Dabgeul
	
	@RequestMapping(value = "/managerselectDabgeulList.do", method = RequestMethod.GET)
	public String selectDabgeulList(Locale locale, Model model) {
		logger.info("답글목록보기 {}.", locale);

		List<DabgeulDto>list=dabgeulService.selectDabgeulList();

		model.addAttribute("list",list);
		return "manager/dabgeul/dabgeullist";		
	}
	
	
	@RequestMapping(value = "/managerinsertDabgeulform.do", method = RequestMethod.GET)
	public String insertdabgeulform(Locale locale, Model model,DabgeulDto dabgeulDto) {
		logger.info("답글 추가폼이동 {}.", locale);

		return "manager/dabgeul/dabgeulinsert";
	}

	@RequestMapping(value = "/managerinsertDabgeul.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertDabgeul(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,DabgeulDto dabgeulDto) {
		logger.info("답글 추가하기 {}.", locale);

		boolean isS=dabgeulService.InsertDabgeul(dabgeulDto);
		if(isS) {
			return "redirect:managerselectDabgeulList.do";
		}else {//error아직
			model.addAttribute("msg","갤러리추가 실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/managerselectDabgeul.do", method = RequestMethod.GET)
	public String selectDabgeul(Locale locale, Model model, int d_no) {
		logger.info("답글상세보기 {}.", locale);

		DabgeulDto dabgeulDto=dabgeulService.selectDabgeul(d_no);
		model.addAttribute("dabgeulDto", dabgeulDto);

		return "manager/dabgeul/dabgeuldetail";
	}

	@RequestMapping(value = "/managerdabgeulupdateform.do", method = RequestMethod.GET)
	public String dabgeulupdateform(Locale locale, Model model, int d_no) {
		logger.info("답글수정폼이동 {}.", locale);

		DabgeulDto dabgeulDto=dabgeulService.selectDabgeul(d_no);
		model.addAttribute("dabgeulDto",dabgeulDto);

		return "manager/dabgeul/dabgeulupdate";		
	}

	@RequestMapping(value = "/managerupdateDabgeul.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateDabgeul(Locale locale, Model model,DabgeulDto dabgeulDto) {
	System.out.println(dabgeulDto);
		logger.info("답글수정 {}.", locale);
		boolean isS=dabgeulService.updateDabgeul(dabgeulDto);
		if(isS) {
			return "redirect:managerselectDabgeul.do?d_no="+dabgeulDto.getD_no();
		}else {
			model.addAttribute("msg", "갤러리추가 실패");
			return "error";	
		}
	}
	
	@RequestMapping(value = "/managerdeleteDabgeul.do", method = RequestMethod.GET)
	public String deleteDabgeul(Locale locale, Model model,int d_no) {
		logger.info("답글삭제 {}.", locale);

		boolean isS=dabgeulService.deleteDabgeul(d_no);
		if(isS) {
			return "redirect:managerselectDabgeulList.do";
		}else {//error하셈
			model.addAttribute("msg", "글삭제 실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/managerselectenoDabgeulList.do", method = RequestMethod.GET)
	public String selectDabgeulList(Locale locale, Model model, DabgeulDto dabgeulDto,int e_no) {
		logger.info("전시의 답글보기 {}.", locale);
		List<DabgeulDto>list=dabgeulService.selectDabgeulList(e_no);
		model.addAttribute("list",list);
		return "manager/dabgeul/enodabgeullist";		
	}
	
	//Item
	@RequestMapping(value = "/managerselectItemList.do", method = RequestMethod.GET)
	public String selectItemList(Locale locale, Model model) {
		logger.info("작품목록보기 {}.", locale);

		List<ItemDto>list=itemService.selectItemList();

		model.addAttribute("list",list);
		return "manager/item/itemlist";		
	}
	
	@RequestMapping(value = "/managerinsertItemform.do", method = RequestMethod.GET)
	public String insertitemform(Locale locale, Model model,ItemDto itemDto) {
		logger.info("작품 추가폼이동 {}.", locale);
		
		return "manager/item/iteminsert";
	}
	

	@RequestMapping(value = "/managerinsertItem.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertItem(HttpServletRequest request, HttpServletResponse response,Locale locale,
			Model model) {
		logger.info("작품 추가하기 {}.", locale);
		
	
		MultipartHttpServletRequest multi=(MultipartHttpServletRequest)request;
		
		int e_no=Integer.parseInt(multi.getParameter("e_no")) ;
		String i_name=multi.getParameter("i_name");
		String i_explain=multi.getParameter("i_explain");
		int i_price=Integer.parseInt(multi.getParameter("i_price"));
		int a_no=Integer.parseInt(multi.getParameter("a_no"));
		int m_no = Integer.parseInt(multi.getParameter("m_no"));
		
		MultipartFile multifile=multi.getFile("i_img");
		
		
		String i_img=multifile.getOriginalFilename();
		
		String stored_fname=createUUId()
				+(i_img.substring(i_img.lastIndexOf(".")));
			
							
		File file=new File("C:/Users/itcam/git/galleryweb/Gallery3/src/main/webapp/uploadFiles/"+stored_fname);
		try {
			multifile.transferTo(file);
		}catch(IllegalStateException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		
		boolean isS=itemService.insertItem(new ItemDto(0,e_no,i_name,i_explain,stored_fname,i_price,a_no,m_no));
		if(isS) {
			return "redirect:managerselectItemList.do";
		}else {//error아직
			model.addAttribute("msg","갤러리추가 실패");
			return "error";
		}
	}
		
	
	@RequestMapping(value = "/managerselectItem.do", method = RequestMethod.GET)
	public String selectItem(Locale locale, Model model, int i_no) {
		logger.info("작품상세보기 {}.", locale);

		ItemDto itemDto=itemService.selectItem(i_no);
		model.addAttribute("itemDto", itemDto);

		return "manager/item/itemdetail";
	}

	@RequestMapping(value = "/manageritemupdateform.do", method = RequestMethod.GET)
	public String itemupdateform(Locale locale, Model model, int i_no) {
		logger.info("작품수정폼이동 {}.", locale);

		ItemDto itemDto=itemService.selectItem(i_no);
		model.addAttribute("itemDto",itemDto);

		return "manager/item/itemupdate";		
	}
	
	@RequestMapping(value = "/managerupdateItem.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateItem(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) {
		logger.info("작품수정 {}.", locale);
	
		MultipartHttpServletRequest multi=(MultipartHttpServletRequest)request;
		
		ItemDto itemDto = new ItemDto();
		int i_no=Integer.parseInt(multi.getParameter("i_no"));
		int e_no = Integer.parseInt(multi.getParameter("e_no"));
		String i_name=multi.getParameter("i_name");
		String i_explain=multi.getParameter("i_explain");
		int i_price=Integer.parseInt(multi.getParameter("i_price"));
		int a_no=Integer.parseInt(multi.getParameter("a_no"));
		int m_no=Integer.parseInt(multi.getParameter("m_no"));
		
		ItemDto registeredItemDto=itemService.selectItem(i_no);
		
		itemDto.setI_no(i_no);
		itemDto.setE_no(e_no);
		itemDto.setI_name(i_name);
		itemDto.setI_explain(i_explain);
		itemDto.setI_price(i_price);
		itemDto.setA_no(a_no);
		itemDto.setM_no(m_no);
		
		MultipartFile multifile=multi.getFile("i_img");
		
		String i_img=multifile.getOriginalFilename();
		if(i_img.isEmpty()) {
			itemDto.setI_img(registeredItemDto.getI_img());
			//continue;
		}
		
		String stored_fname=createUUId()
				+(i_img.substring(i_img.lastIndexOf(".")));
			
		
		File file=new File("C:/Users/itcam/git/galleryweb/Gallery3/src/main/webapp/uploadFiles/"+stored_fname);
		try {
			multifile.transferTo(file);
		}catch(IllegalStateException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		itemDto.setI_img(stored_fname);
		
		System.out.println(itemDto.toString());
		boolean isS=itemService.updateItem(itemDto);
		if(isS) {
			return "redirect:managerselectItem.do?i_no="+itemDto.getI_no();
		}else {
			model.addAttribute("msg", "갤러리추가 실패");
			return "error";	
		}
	}
	
	
	
	@RequestMapping(value = "/managerselectenoItemList.do", method = RequestMethod.GET)
	public String selectE_noItemList(Locale locale, Model model,int e_no) {
		logger.info("전시작품목록보기 {}.", locale);

		List<ItemDto>list=itemService.selectE_noItemList(e_no);

		model.addAttribute("list",list);
		return "manager/item/enoitemlist";		
	}
	
	
	@RequestMapping(value = "/manageritemenoupdateform.do ", method = RequestMethod.GET)
	public String enoitemupdateform(Locale locale, Model model,int[] i_nos,int e_no) {
		
		logger.info("전시작품수정폼이동 {}.", locale);

		ItemDto itemDto=(ItemDto) itemService.selectE_noItemList(e_no);
		System.out.println(itemDto);
		model.addAttribute("itemDto",itemDto);

		return "manager/item/itemenoupdate";		
	}
	
	@RequestMapping(value = "/managerinsertItemform1.do", method = RequestMethod.GET)
	public String insertitemform1(Locale locale, Model model,ItemDto itemDto) {
		logger.info("작품 추가폼이동 {}.", locale);

		return "manager/item/iteminserteno";
	}

	@RequestMapping(value = "/managerinsertItem1.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertItem1(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,ItemDto itemDto) {
		
		logger.info("작품 추가하기 {}.", locale);

		boolean isS=itemService.insertItem(itemDto);
		System.out.println(itemDto);
		if(isS) {
			System.out.println(isS);
			return "redirect:managerselectenoItemList.do?e_no="+itemDto.getE_no();
		}else {//error아직
			model.addAttribute("msg","갤러리추가 실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/managerdeleteItem.do", method = RequestMethod.GET)
	public String deleteItem(Locale locale, Model model,int i_no) {
		logger.info("작품삭제 {}.", locale);

		boolean isS=itemService.deleteItem(i_no);
		if(isS) {
			return "redirect:managerselectItemList.do";
		}else {//error하셈
			model.addAttribute("msg", "글삭제 실패");
			return "error";
		}
	}
	
	//callendar
	@RequestMapping(value = "/managerselectCallendarList.do", method = RequestMethod.GET)
	public String selectCallendarList(Locale locale, Model model) {
		logger.info("전시일정목록보기 {}.", locale);

		List<CallendarDto>list=callendarService.selectCallendarList();

		model.addAttribute("list",list);
		return "manager/callendar/callendarlist";		
	}
	
	@RequestMapping(value = "/managerinsertcallendarform.do", method = RequestMethod.GET)
	public String insertcallendarform(Locale locale, Model model,CallendarDto callendarDto) {
		logger.info("일정 추가폼이동 {}.", locale);

		return "manager/callendar/callendarinsert";
	}
	//아직
	@RequestMapping(value = "/managerinsertCallendar.do", method =  RequestMethod.POST)
	public String insertCallendar(Locale locale, Model model,CallendarDto callendarDto) {
		logger.info("일정 추가하기 {}.", locale);
		System.out.println(callendarDto);
		boolean isS=callendarService.insertCallendar(callendarDto);
		if(isS) {
			return "redirect:managerselectCallendarList.do";
		}else {//error아직
			model.addAttribute("msg","일정추가 실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/managerselectCallendar.do", method = RequestMethod.GET)
	public String selectCallendar(Locale locale, Model model, int c_no) {
		logger.info("작품상세보기 {}.", locale);

		CallendarDto callendarDto=callendarService.selectCallendar(c_no);
		model.addAttribute("callendarDto", callendarDto);

		return "manager/callendar/callendardetail";
	}
	

	@RequestMapping(value = "/managercallendarupdateform.do", method = RequestMethod.GET)
	public String callendarupdateform(Locale locale, Model model, int c_no) {
		logger.info("일정수정폼이동 {}.", locale);
		
		CallendarDto callendarDto=callendarService.selectCallendar(c_no);
		model.addAttribute("callendarDto",callendarDto);

		return "manager/callendar/callendarupdate";		
	}
	
	@RequestMapping(value = "/managerupdateCallendar.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateCallendar(Locale locale, Model model,CallendarDto callendarDto) {
		System.out.println(callendarDto);
		logger.info("일정수정 {}.", locale);
		boolean isS=callendarService.updateCallendar(callendarDto);
		if(isS) {
			return "redirect:managerselectCallendar.do?c_no="+callendarDto.getC_no();
		}else {
			model.addAttribute("msg", "일정수정 실패");
			return "error";	
		}
	}
	
	@RequestMapping(value = "/managerdeleteCallendar.do", method = RequestMethod.GET)
	public String deleteCallendar(Locale locale, Model model,int c_no) {
		logger.info("일정삭제 {}.", locale);

		boolean isS=callendarService.deleteCallendar(c_no);
		if(isS) {
			return "redirect:managerselectCallendarList.do";
		}else {//error하셈
			model.addAttribute("msg", "글삭제 실패");
			return "error";
		}
	}
//	
//	@RequestMapping(value = "/managerselectCallendarList1.do", method = RequestMethod.GET)
//	public String selectCallendarList(Locale locale, Model model, int g_no, GalleryDto galleryDto) {
//
//		logger.info("갤러리정보보기 {}.", locale);
//		
//		System.out.println(galleryDto);
//		CallendarDto callendarDto=callendarService.selectCallendarList(g_no); 
//		model.addAttribute("callendarDto", callendarDto);
//
//		return "redirect:managerselectGallery.do?g_no"+galleryDto.getG_no();
//		
//				
//	}
}
