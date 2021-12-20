package com.kh.spring.sharing.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.common.HiSpringUtils;
import com.kh.spring.sharing.model.service.BoardService;
import com.kh.spring.sharing.model.vo.Board;

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
	
	@PostMapping("/boardEnroll.do")
	public String boardEnroll(
			Board board,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles,
			RedirectAttributes redirectAttr
		) throws IllegalStateException, IOException {
		
		try {
			// 첨부파일 list생성
		
			for(MultipartFile upFile : upFiles) {
				
				log.debug("upFile = {}", upFile);
				log.debug("upFile.name = {}", upFile.getOriginalFilename());
				log.debug("upFile.size = {}", upFile.getSize());
			}
			// 업무로직
			
			int result = boardService.insertBoard(board);
			String msg = result > 0 ? "게시글 등록 성공!" : "게시글 등록 실패!";
			redirectAttr.addFlashAttribute("msg", msg);
			
		} catch(Exception e) {
			log.error(e.getMessage(), e); 
			throw e; 
		}
		
		return "redirect:/sharing/boardList.do";
	}
	
}
