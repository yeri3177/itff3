package com.kh.spring.sharing.controller;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.logout;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
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
import com.kh.spring.sharing.model.service.BoardService;
import com.kh.spring.sharing.model.vo.Attachment;
import com.kh.spring.sharing.model.vo.Board;
import com.kh.spring.sharing.model.vo.BoardComment;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/sharing")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/boardList.do")
	public String BoardList(
			@RequestParam(defaultValue = "1") int cPage,
			Model model,
			HttpServletRequest request
		) { // cPage가 넘어오지 않으면 에러나기때문에 기본값을 주어야 한다.
		
		log.debug("cPage = {}", cPage);
		
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		// 1.전체 게시글 목록 가져오기(첨부파일 갯수 포함)
		List<Board> list = boardService.selectBoardList(offset, limit);
		log.debug("BoardList = {}", list);
		model.addAttribute("list", list);
		
		// 2. 총 게시물 수 가져오기
		int totalContent = boardService.selectBoardTotalCount();
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);
		
		
		// 3. pagebar
		String url = request.getRequestURI(); // /spring/sharing/boardList.do
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
		log.debug("pagebar = {}", pagebar);
		model.addAttribute("pagebar", pagebar);
		
		return "sharing/boardList";
	
	}
	
	@GetMapping("/boardForm.do")
	public void boardForm() {}
	
	//@RequestMapping(value="/sharing/boardEnroll.do", method=RequestMethod.POST)
	@PostMapping("/boardEnroll.do")
	public String boardEnroll(
			Board board,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles,
			RedirectAttributes redirectAttr
			
		) throws IllegalStateException, IOException {
		
		log.debug("board = {}", board);
		
		try {
			
		    // login한 맴버 id가져오기
			/* Authentication authentication */
			//Member member = (Member)authentication.getPrincipal();
			//String MemberId = member.getId();
			
			
			// 첨부파일 list생성
			List<Attachment> attachments = new ArrayList<>();
			
			// application객체 (ServletContext)
			String saveDirectory = application.getRealPath("/resources/upload/board");
			log.debug("saveDirectory = {}", saveDirectory);
				
			for(MultipartFile upFile : upFiles) {
				
				if(!upFile.isEmpty() && upFile.getSize() != 0) {
					
					log.debug("upFile = {}", upFile);
					log.debug("upFile.name = {}", upFile.getOriginalFilename());
					log.debug("upFile.size = {}", upFile.getSize());

					String originalFilename = upFile.getOriginalFilename();
					String renamedFilename = HiSpringUtils.getRenamedFilename(originalFilename);
					
					// 1.서버컴퓨터에 저장
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
			
			//조회수 증가 쿼리
	        //boardservice.increaseViewCount(member_bno, session);
	        //ModelAndView mav = new ModelAndView();
	        //mav.setViewName("board/memberboardview");
	        
			// 업무로직
			if(!attachments.isEmpty())
				board.setAttachments(attachments);
			
			int result = boardService.updateBoard(board);
			String msg = result > 0 ? "게시글 등록 성공!" : "게시글 등록 실패!";
			redirectAttr.addFlashAttribute("msg", msg);
		} catch(Exception e) {
			log.error(e.getMessage(), e);  // 로킹
			throw e; // spring container에게 던짐.
		}
		return "redirect:/sharing/boardList.do";
	}
	
	@GetMapping("/boardDetail.do")
	public String boardDetail(HttpServletRequest request, HttpServletResponse response, @RequestParam int no, @RequestParam(required = false) String memberId, Model model) {
		log.debug("no = {}", no);
		log.debug("memberId = {}", memberId);
		
		Cookie[] cookies = request.getCookies();
		log.debug("cookies = {}", cookies);
		boolean hasRead = false;
		String boardValue = "";
		
		System.out.println(cookies == null ? "null" : "not null");
		if(cookies != null) {
			for(Cookie c : cookies) {
				String name = c.getName();
				String value = c.getValue();
				System.out.println(name + " : " + value);
				
				if("board".equals(name)) {
					boardValue = value;
					if(value.contains("|"+ no + "|")) {
						hasRead = true;
					}
					break;
				}
 			}
		}
		//게시글을 처음 읽는 경우
		int result = 0;
		if(!hasRead) {
			//게시글 Cookie
			Cookie cookie = new Cookie("board", boardValue + "|" + no + "|" );
			cookie.setMaxAge(365 * 24 * 60 * 60 );
			cookie.setPath(request.getContextPath() + "/sharing/boardDetail.do"); 
			System.out.println("new cookie" + cookie.getName() + " : " + cookie.getValue());
			response.addCookie(cookie);
			
			// 조회수 증가
			result = boardService.updateBoardReadCount(no);
		}
		
		
		// 업무로직
		//Board board = boardService.selectOneBoard(no);
		// 게시글 가져오기
		Board board = boardService.selectOneBoardCollection(no);
		log.debug("board = {}", board);
		// 댓글목록 가져오기
		List<BoardComment> commentList = boardService.selectCommentList(no);
		log.debug("CommentList = {}", commentList);
		
		model.addAttribute("board", board);
		model.addAttribute("commentList", commentList);
		
		return "sharing/boardDetail";
	}
	
	@PostMapping("/boardCommentEnroll.do")
	public String boardCommentEnroll(BoardComment boardComment) {
		log.debug("boardComment = {}", boardComment);
		
		int result = boardService.insertBoardComment(boardComment);
		log.debug("result = {}", result);
		
		return "redirect:/sharing/boardDetail.do?no=" + boardComment.getBoardNo();
	}
	
	@PostMapping("/boardCommentDelete.do")
	public String boardCommentDelete(@RequestParam int no, @RequestParam int boardNo) {
		log.debug("no = {}", no);
		
		int result = boardService.deleteBoardComment(no);
		log.debug("result = {}", result);
		
		return "redirect:/sharing/boardDetail.do?no=" + boardNo;
	}
	
	@GetMapping("/boardUpdate.do")
	public void boardUpdate(@RequestParam int no, Model model) {
		log.debug("boardNo = {}", no);
		Board board = boardService.selectOneBoardCollection(no);
		log.debug("board = {}", board);
		model.addAttribute("board", board);
	}
	
	@PostMapping("/boardUpdate.do")
	public String boardUpdate(
			Board board,
			@RequestParam String memberId,
			@RequestParam(value = "upFile", required = false) MultipartFile[] upFiles,
			@RequestParam(required=false) int[] delFile,
			RedirectAttributes redirectAttr	
		) throws IllegalStateException, IOException {
		
		try {
			log.debug("board = {}", board);
			log.debug("memberId = {}", memberId);
			log.debug("delFile = {}", delFile);
			
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
					
					// 2. DB attachment 레코드 등록
					Attachment attach = new Attachment();
					attach.setMarketNo(board.getNo());
					attach.setRenamedFilename(renamedFilename);
					attach.setOriginalFilename(originalFilename);
					attachments.add(attach);
					log.debug("첨부파일 수정 완료 = {}", attachments);
				}
			}
			
			// 업무로직
			int result = 0;
			
			if(delFile != null) {
				for(int i = 0; i < delFile.length; i++) {
					
					Attachment attach = boardService.selectOneAttachment(delFile[i]);
					log.debug("attach = {}", attach);
					File targetFile = new File(saveDirectory, attach.getRenamedFilename());
					targetFile.delete();
					result = boardService.deleteAttachment(delFile[i]);
					log.debug("result = {}", result);
				}
			}
			
			if(!attachments.isEmpty())
				board.setAttachments(attachments);
			
			result = boardService.updateBoard(board);
//			String msg = result > 0 ? "게시글 업로드 성공!" : "게시글 업로드 실패!";
//			redirectAttr.addFlashAttribute("msg", msg);
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw e;
		}
		
		return "redirect:/sharing/boardDetail.do?no="+board.getNo();
	}
	
	@PostMapping("/boardDelete.do")
	public String deleteBoard(@RequestParam int no) {
		
		try {
			log.debug("no = {}", no);
			
			// 전달될 글번호로 글 찾아서 가져오기
			Board board = boardService.selectOneBoardCollection(no);
			
			// 가져온 글의 첨부파일 목록
			List<Attachment> attach = board.getAttachments();
			log.debug("attach = {}", attach);
			
			String saveDirectory = application.getRealPath("/resources/upload/board");
			
			for(Attachment _attach : attach) {
				log.debug("attach = {}", attach);
				if(_attach.getAttachNo() != 0) {
					File targetFile = new File(saveDirectory, _attach.getRenamedFilename());
					targetFile.delete();
				}
			}
			
			int result = boardService.deleteOneBoard(no);
			String msg = result > 0 ? no + "게시글 삭제 성공" : no + "게시글 삭제 실패";
			log.debug(msg);

		} catch (InvalidParameterException e) {
			log.error(e.getMessage(), e);
			//redirectAttr.addFlashAttribute("msg", e.getMessage());
		} catch (Exception e) {
			log.error("게시글 삭제 오류!", e);
			throw e;
		}
		
		return "redirect:/sharing/boardList.do";
	}
	
	/**
	 * Resource인터페이스를 통한 자원의 일관된 처리
	 * - 외부URL에 대한 자원 (URLConnection)
	 * - 서버 fileSystem의 자원
	 * - classpath 자원
	 * - web root directory 자원
	 * 
	 * @param no
	 */
	@GetMapping("/fileDownload.do")
	public Resource fileDownload(@RequestParam int no, HttpServletResponse response) throws UnsupportedEncodingException {
		// 1. 업무로직 : db attachment 행 조회
		log.debug("no = {}", no);
		Attachment attach = boardService.selectOneAttachment(no);
		log.debug("attach = {}", attach);
		
		// 2.다운로드할 파일 경로 가져오기
		String saveDirectory = application.getRealPath("/resources/upload/board");
		File downFile = new File(saveDirectory, attach.getRenamedFilename());
		
		// 3.Resource객체 생성
		Resource resource = resourceLoader.getResource("file:" + downFile);
		log.debug("file:{}", downFile);
		
		// 4.헤더값 설정
		String filename = new String(attach.getOriginalFilename().getBytes("utf-8"), "iso-8859-1");
		response.addHeader("Content-Disposition", "attachment; filename=" + filename);
		
		return resource;

	}
	/**
	 * URL Resource
	 * - 외부자원
	 * - 웹크롤링
	 * 
	 * @return
	 */
	@GetMapping(
		value = "/resource.do",
		produces = MediaType.APPLICATION_OCTET_STREAM_VALUE
	)
	@ResponseBody
	public Resource resource(HttpServletResponse response) {
		Resource resource = resourceLoader.getResource("https://docs.oracle.com/javase/8/docs/api/java/io/File.html");
		log.debug("resource = {}", resource);
		response.addHeader("Content-Disposition", "attachment; filename=File.html");
		return resource;
	}

}
