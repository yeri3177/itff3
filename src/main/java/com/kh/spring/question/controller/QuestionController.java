package com.kh.spring.question.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
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
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.question.model.service.QuestionService;
import com.kh.spring.question.model.vo.Question;
import com.kh.spring.sharing.model.vo.Attachment;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/question")
@Slf4j
public class QuestionController {

	@Autowired
	private QuestionService questionService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/faq.do")
	public void faq() {}
	
	@GetMapping("/questionForm.do")
	public void questionForm() {}
	
	@PostMapping("/questionEnroll.do")
	public String questionEnroll(
			@RequestParam(value= "upFile", required =false) MultipartFile upFile,
			@ModelAttribute Question question,
			RedirectAttributes redirectAttr
			) {
		
		try {
			String saveDirectory = application.getRealPath("/resources/upload/question");
			
			List<Attachment> attachments = new ArrayList<>();
			
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
			
			if(!attachments.isEmpty()) {
				question.setAttachments(attachments);
			}
			
			int result = questionService.insertQuestion(question);
			
			String msg = result > 0 ? "질문 저장 완료" : "질문 저장 실패";
			log.debug("질문 db 저장 됨? {}", msg);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/question/questionList.do";
		
	}
	
	@GetMapping("/questionList.do")
	public String questionList(
			Model model,
			@RequestParam(defaultValue = "1") int cPage,
			HttpServletRequest request,
			Authentication authentication
			) {
		
		try {
			Member member = (Member) authentication.getPrincipal();
			log.debug("[principal] member = {}", member);

			String id = member.getId();
			log.debug("아이디 가져와랑 {}", id);
			
			log.debug("여기서 model {}", model); // 없넹?
			log.debug("cPage = {}", cPage);
			
			
			
			int limit = 10;
			int offset = (cPage - 1) * limit;
			
			// map에 담기
			Map<String, Object> param = new HashMap<>();
			param.put("memberId", id);
			param.put("limit", limit);
			param.put("offset", offset);
			
			// 전체 게시물 목록
			List<Question> questionList = questionService.selectQuestionList(param);
			log.debug("questionList = {}", questionList);
			model.addAttribute("questionList",questionList);
			
			// 전체 게시물 수 구하기
			int totalContent = questionService.countTotalContent(id);
			log.debug("전체 게시물 수 {}", totalContent + "개");
			
			// pagebar
			String url = request.getRequestURI();
			String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
			log.debug("pagebar ?{}", pagebar);
			model.addAttribute("pagebar", pagebar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "question/questionList";
	}
	
	
	@GetMapping("/questionDetail.do")
	public void questionDetail(@RequestParam int no,Model model) {
		log.debug("글번호 가져옴? {}", no);
		
		Question question = questionService.selectQuestionCollection(no);
		log.debug("가져온 question {}", question);
		model.addAttribute("question", question);
		
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
			
			log.debug("가져온 int no = {}", no);
			
			// db attachment 행 조회하기
			Attachment attach = questionService.selectOneAttachment(no);
			log.debug("attach = {}", attach);
			
			// 실제 다운로드 할 파일경로 가져오기
			String saveDirectory = application.getRealPath("/resources/upload/question");
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
	@GetMapping("/questionUpdate.do")
	public void questionUpdate(@RequestParam int no, Model model) {
		log.debug("수정 할 글번호 = {}", no);
		
		Question question = questionService.selectQuestionCollection(no);
		
		log.debug("question = {}", question);
		model.addAttribute("question", question);
	}
	
	@PostMapping("/questionUpdate.do")
	public String questionUpdate(
			 @RequestParam(value = "upFile", required = false) MultipartFile upFile,
	         @ModelAttribute Question question,
	         @RequestParam int delFile1,
	         RedirectAttributes redirectAttr
			) {
				log.debug("question???????????{}", question);
		try {
			int result = 0;
			String saveDirectory = application.getRealPath("/resources/upload/question");
			log.debug("sevaDirectory = {}", saveDirectory);
			
			List<Attachment> attachments = new ArrayList<>();
			
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
			
			if(!attachments.isEmpty())
				question.setAttachments(attachments);
			log.debug("여기 question 뭔데 {}", question);
			result = questionService.updateQuestion(question);
			
			log.debug("delFile1 몇? {}", delFile1);
			
			if(delFile1 != 0) {
				int attachNo1 = delFile1;
				Attachment attach = questionService.selectOneAttachment(attachNo1);
				
				// 서버컴퓨터에서 파일삭제
				File targetFile = new File(saveDirectory, attach.getRenamedFilename());
				targetFile.delete();
				
				// db 레코드 삭제
				result = questionService.deleteQuestionAttachment(attachNo1);
				String yn = result > 0 ? "첨부파일 db에서 삭제됨" : "첨부파일 db에서 삭제 안됨";
				log.debug("delFile1 첨부파일은? {}", yn);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/question/questionDetail.do?no=" + question.getQuestionNo();
	}
	
}
