package com.kh.spring.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.common.HiSpringUtils;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {

	/**
	 * @Autowired
	 * - 타입이 일치하는 빈을 먼저 찾고, 없을 경우 이름이 일치하는 빈을 찾는다.
	 *  
	 */
	@Autowired
	private BoardService boardService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	
	/**
	 * MyBatis의 Rowbounds 객체가 paging 기능을 지원한다.
	 * - offset : 건너뛰어야 할 게시물 수
	 * - limit : 한 페이지에 표시할 게시물 수
	 *  
	 * @param cPage
	 * @param model
	 * @return
	 */
	@GetMapping("/boardList.do")
	public String boardList(
			@RequestParam(defaultValue = "1") int cPage,
			Model model, 
			HttpServletRequest request
		) {    // cPage가 넘어오지 않으면 에러나기때문에 기본값을 준다.
		
		log.debug("cPage = {}", cPage);

		int limit = 10;
		int offset = (cPage - 1) * limit;
	
		// 1. 전체 게시물 목록 가져오기(첨부파일 갯수 포함)
		List<Board> list = boardService.selectBoardList(offset, limit);
		log.debug("BoardList = {}", list);
		model.addAttribute("list", list);
		
		// 2. 총 게시물 수 가져오기
		int totalContent = boardService.selectBoardTotalCount();
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);
		
		// 3. pagebar
		String url = request.getRequestURI();   // /spring/board/boardList.do
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
		log.debug("pagebar = {}", pagebar);
		model.addAttribute("pagebar", pagebar);
		
		return "board/boardList";
	}
	
	
	@GetMapping("/boardForm.do")
	public void boardForm() {}
	
	
	@PostMapping("boardEnroll.do")
	public String boardEnroll(
			Board board, 
			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles, 
			RedirectAttributes redirectAttr
		) throws IllegalStateException, IOException {
		
		try {
			// 첨부파일 list 생성
			List<Attachment> attachments = new ArrayList<>();
			
			// application 객체(ServletContext 타입)
			String saveDirectory = application.getRealPath("/resources/upload/board");
			log.debug("saveDirectory = {}", saveDirectory);
			
			for(MultipartFile upFile : upFiles) {
				if(!upFile.isEmpty() && upFile.getSize() != 0) {
				
					log.debug("upFile = {}", upFile);
					log.debug("upFile.name = {}", upFile.getOriginalFilename());
					log.debug("upFile.size = {}", upFile.getSize());

					String originalFilename = upFile.getOriginalFilename();
					String renamedFilename = HiSpringUtils.getRenamedFilename(originalFilename);
				
					// 1. 서버컴퓨터에 저장
					File dest = new File(saveDirectory, renamedFilename);
					log.debug("dest = {}", dest);
					upFile.transferTo(dest);
				
					// 2. DB에 attachment 레코드 등록
					Attachment attach = new Attachment();
					attach.setRenamedFilename(renamedFilename);
					attach.setOriginalFilename(originalFilename);
					attachments.add(attach);
					
				}
			}
			
			// 업무로직
			if(!attachments.isEmpty())
				board.setAttachments(attachments);
			
			int result = boardService.insertBoard(board);
			String msg = result > 0 ? "게시글 등록 성공!" : "게시글 등록 실패!";
			redirectAttr.addFlashAttribute("msg", msg);
		} catch (Exception e) {
			log.error(e.getMessage(), e);   // 로깅
			throw e;   // spring container에게 던짐
		}
		
		return "redirect:/board/boardList.do";
	}
	
	
	@GetMapping("/boardDetail.do")
	public void boardDetail(@RequestParam int no, Model model) {
		log.debug("no = {}", no);    // 값이 잘 전달되고 있는지 체크하는게 좋다.
		
		// 업무로직
//		Board board = boardService.selectOneBoard(no);   // 보드 하나 조회, 그 글번호 가진 첨부파일들 조회해서 set
		Board board = boardService.selectOneBoardCollection(no);   // mapper에서 collection 써서 한번에 조회
		log.debug("board = {}", board);   
		
		model.addAttribute("board", board);
		
	}
	
	
	/**
	 * Resource 인터페이스를 통한 자원의 일관된 처리
	 * - 외부URL에 대한 자원 (URLConnection) : UrlResource
	 * - 서버 FileSystem의 자원 : FileSystemResource
	 * - classpath 자원 : ClassPathResource
	 * - web root director 자원 : ServletContextResource
	 * 
	 * @ResponseBody
	 * - 응답메시지 바디에 return된 자바객체를 직접 출력할 것.
	 * 
	 * @throws UnsupportedEncodingException 
	 */
	@GetMapping(
			value = "/fileDownload.do",
			produces = MediaType.APPLICATION_OCTET_STREAM_VALUE
	)
	@ResponseBody
	public Resource fileDownload(@RequestParam int no, HttpServletResponse response) throws UnsupportedEncodingException {
		// 1. 업무로직 : db에서 attachment 행 조회
		Attachment attach = boardService.selectOneAttachment(no);
		log.debug("attach = {}", attach);
		
		// 2. 다운로드할 파일 경로 가져오기
		String saveDirectory = application.getRealPath("/resources/upload/board");
		File downFile = new File(saveDirectory, attach.getRenamedFilename()); 
		
		// 3. Resource 객체 생성
//		Resource resource = new FileSystemResource(downFile);
		Resource resource = resourceLoader.getResource("file:" + downFile);
		log.debug("file : {}", downFile);
		
		// 4. 헤더값 설정
		String filename = new String(attach.getOriginalFilename().getBytes("utf-8"), "iso-8859-1");   // 한글 안 깨지게 하려고 getOriginalFilename() 뒤에 덧붙임
//		response.setContentType("application/octet-stream; charset=utf-8");
		response.addHeader("Content-Disposition", "attachment; filename=" + filename);
		
		return resource;
	}
	

	/**
	 * URL Resource
	 * - 외부자원
	 * - 웹 크롤링
	 * 
	 * @return
	 */
	@GetMapping(
			value = "/resource.do",
			produces = MediaType.APPLICATION_OCTET_STREAM_VALUE
	)
	@ResponseBody
	public Resource resource(HttpServletResponse response) {
		
		Resource resource = resourceLoader.getResource("https://www.naver.com");
		log.debug("resource = {}", resource);
		response.addHeader("Content-Disposition", "attachment; filename=naver.html");
		
		return resource;
	}
}













