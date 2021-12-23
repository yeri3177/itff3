package com.kh.spring.notice.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.common.HiSpringUtils;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.notice.model.service.NoticeService;
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.sharing.model.vo.Attachment;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/notice")
@Slf4j
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/noticeList.do")
	public String noticeList(
			Model model,
			@RequestParam(defaultValue = "1") int cPage,
			HttpServletRequest request) {
		
		try {
			log.debug("cPage = {}", cPage); // defaultValue = "1" 로 해둬서 cPage 값이 없으면 1이 나온다.
			
			int limit = 10; // 한페이지당 게시글 수 
			int offset = (cPage - 1) * limit;
			
			// 전체 게시물 목록( 첨부파일 개수 )
			List<Notice> noticeList = noticeService.selectNoticeList(offset, limit);
			log.debug("noticeList = {}", noticeList);
			// jsp에 추가될 수 있도록 model에 담아줌
			model.addAttribute("noticeList", noticeList);
			
			// 전체 게시물 수 구하기
			int totalContent = noticeService.countTotalContent();
			log.debug("전체 게시물 수 = {}", totalContent);
			model.addAttribute("totalContent", totalContent);
			
			// pagebar
			String url = request.getRequestURI(); // /spring/notice/noticeList.do
			String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
			log.debug("pagebar = {}", pagebar);
			model.addAttribute("pagebar", pagebar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "notice/noticeList";
	}

	@GetMapping("/noticeForm.do")
	public void noticeForm() {}
	
	
	@PostMapping("/noticeEnroll.do")
	public String noticeEnroll(
			// 한 게시물에 여러 첨부파일이라 [] 형식
	         @RequestParam(value = "upFile", required = false) MultipartFile[] upFiles,
	         @ModelAttribute Notice notice, 
	         RedirectAttributes redirectAttr
			 ) throws Exception {
		
		try {
			String saveDirectory = application.getRealPath("/resources/upload/notice");
			log.debug("saveDirectory = {}", saveDirectory);
			
			// 첨부파일 List 생성
			List<Attachment> attachments = new ArrayList<>();
			
			for(MultipartFile upFile : upFiles) {
				
				if(!upFile.isEmpty() && upFile.getSize() != 0) {
					
					log.debug("upFile = {}", upFile);
					log.debug("upFile.name = {}", upFile.getOriginalFilename());
					log.debug("upFile.size = {}", upFile.getSize());
					
					// 새이름 부여해서 관리하기
					String originalFilename = upFile.getOriginalFilename();
			        String renamedFilename = HiSpringUtils.getRenamedFilename(originalFilename);
					
					File dest = new File(saveDirectory, renamedFilename);
					log.debug("dest  = {}", dest);
					upFile.transferTo(dest);
					
					// 파일별로 attachment 테이블에 저장되어야 함.
		            // 2. db에 attachment 레코드 등록
		            Attachment attach = new Attachment();
		            attach.setRenamedFilename(renamedFilename);
		            attach.setOriginalFilename(originalFilename);
		            
		            attachments.add(attach);
		            
		            log.debug("하이");
					
				}
			}
			
			if(!attachments.isEmpty()) {
				notice.setAttachments(attachments);
			}
			int result = noticeService.insertNotice(notice);
			
			String msg = result > 0 ? "공지사항이 등록되었습니다." : "등록 실패";
			redirectAttr.addFlashAttribute("msg", msg);
			
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw e;
		}
		
		return "redirect:/notice/noticeList.do";
	}
	
	
	@GetMapping("/noticeDetail.do")
	public void noticeDetail(@RequestParam int no, Model model) {
		log.debug("글번호 = {}", no);
		
		Notice notice = noticeService.selectOneNoticeCollection(no);
		log.debug("notice = {}", notice);
		model.addAttribute("notice", notice);
		
		log.debug("모델이 뭐지? = {}", model);
		
		List<Member> list = noticeService.selectOneloginMember(no);
		log.debug("글번호에 일치하는 멤버의 = {}", list);
		
	}
	
	@GetMapping (
			value = "/fileDownload.do",
			produces = MediaType.APPLICATION_OCTET_STREAM_VALUE
	)
	@ResponseBody
	public Resource fileDownload(@RequestParam int no, HttpServletResponse response) {
		
		// resource 객체 생성
		Resource resource = null;
		try {
			// db attachment 행 조회하기
			Attachment attach = noticeService.selectOneAttachment(no);
			log.debug("attach = {}", attach);
			
			// 실제 다운로드 할 파일경로 가져오기
			String saveDirectory = application.getRealPath("/resources/upload/notice");
			log.debug("saveDirectory 찍히나? {}", saveDirectory);
			
			File downFile = new File(saveDirectory, attach.getRenamedFilename());
			
			resource = resourceLoader.getResource("file:" + downFile);
			log.debug("file : {}", downFile);
			
			// 헤더값 설정
			String filename = new String(attach.getOriginalFilename().getBytes("utf-8"), "iso-8859-1");
			response.addHeader("Content-Disposition", "attachment; filename=" + filename);
			
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resource;
		
	}
	
	/**
    * URL Resource 처리
    * - 외부자원을 자바 앱으로 가져올 때 이용
    * - 웹크롤링할 때 사용하면 좋다.
    */
	@GetMapping(
			value = "/resource.do",
			produces = MediaType.APPLICATION_OCTET_STREAM_VALUE
	)
	@ResponseBody
	public Resource resource(HttpServletResponse response) {
		
		Resource resource = resourceLoader.getResource("https://docs.oracle.com/javase/8/docs/api/java/io/File.html"); // html이 날라왔을 때 html 파일로 다운
		log.debug("resource = {}", resource);
		// 헤더부 설정
		response.addHeader("Content-Disposition", "attachment; filename=File.html");
		
		return resource;
	}
	
	// 게시글 수정하기
	@GetMapping("/noticeUpdate.do")
	public void noticeUpdate(@RequestParam int no, Model model) {
		
		log.debug("글번호 = {}", no);
		
		Notice notice = noticeService.selectOneNoticeCollection(no);
		log.debug("notice = {}", notice);
		model.addAttribute("notice", notice);
		
	}
	
	@PostMapping("/noticeUpdate.do")
	public String noticeUpdate(
			 @RequestParam(value = "upFile", required = false) MultipartFile[] upFiless,
	         @ModelAttribute Notice notice,
	         @RequestParam int delFile1,
	         @RequestParam int delFile2,
	         RedirectAttributes redirectAttr
			) {
		
		try {
			int result = 0;
			String saveDirectory = application.getRealPath("/resources/upload/notice");
			log.debug("saveDirectory = {}",saveDirectory);
			
			List<Attachment> attachments = new ArrayList<>();
			
			for(MultipartFile upFile : upFiless) {
				
				if(!upFile.isEmpty() && upFile.getSize() != 0) {
					
					log.debug("upFile = {}", upFile);
			        log.debug("upFile.name = {}", upFile.getOriginalFilename());
			        log.debug("upFile.size = {}", upFile.getSize());
					
			        // 새 이름 부여해서 관리하기
			        String originalFilename = upFile.getOriginalFilename();
			        String renamedFilename = HiSpringUtils.getRenamedFilename(originalFilename);
			        
			        File dest = new File(saveDirectory, renamedFilename);
			        log.debug("dest = {}", dest);
			        upFile.transferTo(dest);
			        
			        // 파일별로 attachment 테이블에 저장되어야 함.
			        // 2. db에 attachment 레코드 등록
			        Attachment attach = new Attachment();
			        attach.setRenamedFilename(renamedFilename);
			        attach.setOriginalFilename(originalFilename);
			        
			        attachments.add(attach);
			        
				}
			}
			
			// 게시물 수정 + 새 첨부파일 등록
			
			if(!attachments.isEmpty())
				notice.setAttachments(attachments);
			
			result = noticeService.updateNotice(notice);

			log.debug("delFile1 몇? {}", delFile1);
			log.debug("delFile2 몇? {}", delFile2);
			// 첨부파일이 변경되었거나 삭제 체크박스가 체크되면 기존 첨부파일 삭제
			
			if(delFile1 != 0 && delFile2 != 0) {
				int attachNo1 = delFile1;
				Attachment attach = noticeService.selectOneAttachment(attachNo1);
				
				// 서버컴퓨터에서 파일삭제
				File targetFile = new File(saveDirectory, attach.getRenamedFilename());
				targetFile.delete();
				
				// db 레코드 삭제
				result = noticeService.deleteNoticeAttachment(attachNo1);
				String yn = result > 0 ? "첨부파일 db에서 삭제됨" : "첨부파일 db에서 삭제 안됨";
				log.debug("delFile1 첨부파일은? {}", yn);
				
				int attachNo2 = delFile2;
				attach = noticeService.selectOneAttachment(attachNo2);
				
				// 서버컴퓨터에서 파일삭제
				targetFile = new File(saveDirectory, attach.getRenamedFilename());
				targetFile.delete();
				
				// db 레코드 삭제
				result = noticeService.deleteNoticeAttachment(attachNo2);
				yn = result > 0 ? "첨부파일 db에서 삭제됨" : "첨부파일 db에서 삭제 안됨";
				log.debug("delFile2 첨부파일은? {}", yn);
				
			}
			else if (delFile1 != 0 && delFile2 == 0) {
				int attachNo1 = delFile1;
				Attachment attach = noticeService.selectOneAttachment(attachNo1);
				
				// 서버컴퓨터에서 파일삭제
				File targetFile = new File(saveDirectory, attach.getRenamedFilename());
				targetFile.delete();
				
				// db 레코드 삭제
				result = noticeService.deleteNoticeAttachment(attachNo1);
				String yn = result > 0 ? "첨부파일 db에서 삭제됨" : "첨부파일 db에서 삭제 안됨";
				log.debug("delFile1 첨부파일은? {}", yn);
			}
			else if (delFile1 == 0 && delFile2 != 0) {
				int attachNo2 = delFile2;
				Attachment attach = noticeService.selectOneAttachment(attachNo2);
				
				// 서버컴퓨터에서 파일삭제
				File targetFile = new File(saveDirectory, attach.getRenamedFilename());
				targetFile.delete();
				
				// db 레코드 삭제
				result = noticeService.deleteNoticeAttachment(attachNo2);
				String yn = result > 0 ? "첨부파일 db에서 삭제됨" : "첨부파일 db에서 삭제 안됨";
				log.debug("delFile2 첨부파일은? {}", yn);
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		
		
		
		return "redirect:/notice/noticeDetail.do?no=" + notice.getNoticeNo();
		
	}
	
	@GetMapping("/noticeDelete.do")
	public String noticeDelete(@RequestParam int no, Notice notice) {
		
		log.debug("해당 글번호가 왔니? {}", no);
		log.debug("delete에서의 notice는? {}", notice);

		
		// 여기서 no 는 notice_board의 글번호
		List<Attachment> attach = noticeService.selectAttachmentByNoticeNo(no);
		log.debug("attach는? {}", attach);
		
		
		// 파일을 서버에서도 삭제
		if(attach.size() >= 2) {
			log.debug("첫번째 attach? {}", attach.get(0));
			log.debug("두번째 attach? {}", attach.get(1));
			
			for(int i = 0; i < attach.size(); i++) {
				if(attach.get(i) != null && attach.get(i).getNoticeNo() != 0) {
					log.debug("첨부파일 있음");
					
					String saveDirectory = application.getRealPath("/resources/upload/notice");
					File targetFile = new File(saveDirectory, attach.get(i).getRenamedFilename());
					boolean isDelete = targetFile.delete();
					log.debug("서버에서 파일 삭제 됐니? = {}", isDelete);
				}
				
			}
		}
		
		else if(attach.size() == 1) {
			log.debug("첫번째 attach? {}", attach.get(0));
			String saveDirectory = application.getRealPath("/resources/upload/notice");
			File targetFile = new File(saveDirectory, attach.get(0).getRenamedFilename());
			boolean isDelete = targetFile.delete();
			log.debug("서버에서 파일 삭제 됐니? = {}", isDelete);
		}
		
		
		int result = noticeService.deleteOneNotice(no);
		String msg = result > 0 ? no + "번 글 삭제됨" : no + "번 글 삭제 실패함";
		log.debug(msg);
		
		
		return "redirect:/notice/noticeList.do";
	}
	
	
}
