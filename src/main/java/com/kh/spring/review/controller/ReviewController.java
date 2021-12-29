package com.kh.spring.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.common.HiSpringUtils;
import com.kh.spring.review.model.service.ReviewService;
import com.kh.spring.review.model.vo.Review;
import com.kh.spring.review.model.vo.ReviewComment;
import com.kh.spring.review.model.vo.ReviewLike;
import com.kh.spring.sharing.model.vo.Attachment;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/review")
@Slf4j
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/reviewList.do")
	public void reviewList(
			Model model,
			@RequestParam(defaultValue = "1") int cPage,
			HttpServletRequest request) {
		
		log.debug("cPage = {}", cPage);

		int limit = 20;
		int offset = (cPage - 1) * limit;
	
		// 1. 전체 게시물 목록 가져오기(첨부파일 갯수 포함)
		List<Review> list = reviewService.selectReviewList(offset, limit);
		log.debug("ReviewList = {}", list);
		model.addAttribute("list", list);
		
		// 2. 총 게시물 수 가져오기
		int totalContent = reviewService.selectReviewTotalCount();
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);
		
		// 3. pagebar
		String url = request.getRequestURI();   // /spring/board/boardList.do
		String pagebar = HiSpringUtils.getReviewPagebar(cPage, limit, totalContent, url);
		log.debug("pagebar = {}", pagebar);
		model.addAttribute("pagebar", pagebar);
		
	}
	
	
	@GetMapping("/reviewForm.do")
	public void reviewForm() {}
	
	
	@PostMapping("/reviewEnroll.do")
	public String reviewEnroll(
			Review review, 
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
				review.setAttachments(attachments);
			
			log.debug("review = {}", review);
			int result = reviewService.insertReview(review);
			String msg = result > 0 ? "게시글 등록 성공!" : "게시글 등록 실패!";
			redirectAttr.addFlashAttribute("msg", msg);
		} catch (Exception e) {
			log.error(e.getMessage(), e);   // 로깅
			throw e;   // spring container에게 던짐
		}
		
		return "redirect:/review/reviewDetail.do?reviewNo=" + review.getReviewNo();
	}	
	
	
	/**
	 * HttpServletRequest request, HttpServletResponse response 이거 넣으니까 뷰가 안 나와서 public void를 public String으로 변경하니까 됐다.
	 */
	@GetMapping("/reviewDetail.do")
	public String reviewDetail(HttpServletRequest request, HttpServletResponse response, @RequestParam int reviewNo, Model model, @RequestParam(required = false) String memberId) {
		log.debug("reviewNo = {}", reviewNo);    // 값이 잘 전달되고 있는지 체크하는게 좋다.
		
		// 읽음 여부 확인(cookie)
		Cookie[] cookies = request.getCookies();
		log.debug("cookies = {}", cookies);
		boolean hasRead = false;
		String reviewBoardValue = "";
		
		System.out.println(cookies == null ? "null" : "not null");
		if(cookies != null) {
			for(Cookie c : cookies) {
				log.debug("c = {}", c);
				String name = c.getName();
				log.debug("name = {}", name);
				String value = c.getValue();
				log.debug("value = {}", value);
				System.out.println(name + " : " + value);
				
				if("review".equals(name)) {
					reviewBoardValue = value;
					if(value.contains("|"+ reviewNo + "|")) {
					hasRead = true;
					}
					break;
				}
			}
		}
		
		// 게시글을 처음 읽는 경우
		int result = 0;
		if(!hasRead) {
			// 게시글 Cookie
			Cookie cookie = new Cookie("review", reviewBoardValue + "|" + reviewNo + "|" );
			cookie.setMaxAge(365 * 24 *60 *60);
			cookie.setPath(request.getContextPath() + "/review/reviewDetail.do");  // 해당 요청시에만 이 cookie를 전송하겠다는 뜻. 처음에 /review/reviewDetail 이라고 적었더니 쿠키가 안 나왔다. .do 까지 적어서 진짜 주소창에 보이는 걸로 써야 나오는거였다.
			System.out.println("new cookie" + cookie.getName() + " : " + cookie.getValue());
			response.addCookie(cookie);
			
			// 조회수 증가
			result = reviewService.updateReviewBoardReadCount(reviewNo);		
		}
		
		// 업무로직
		// 게시글 가져오기
		Review review = reviewService.selectOneReviewCollection(reviewNo);   // mapper에서 collection 써서 한번에 조회
		log.debug("review = {}", review);   
		
		// 댓글목록 가져오기
		List<ReviewComment> commentList = reviewService.selectCommentList(reviewNo);
		log.debug("commentList = {}", commentList);
		
		if(memberId != null) {
		// 좋아요 수 가져오기
		ReviewLike reviewLike = new ReviewLike(0, memberId, reviewNo); 
		int heartCheck = reviewService.getReviewLike(reviewLike);
		log.debug("heartCheck = {}", heartCheck);
		
		model.addAttribute("heartCheck", heartCheck);
		}
		
		//로그인 하지 않은 경우 heartCheck에 -1(그냥 0 1 외 아무숫자)를 담아 보낸다. 아예 안 주니까 jsp에서 에러남
		int heartCheck = -1;
		model.addAttribute("heartCheck", heartCheck);
		
		model.addAttribute("review", review);
		model.addAttribute("commentList", commentList);
		
//		public String이면 리턴을 이렇게 써야하는 줄 알았는데 이게 아니고 그냥 jsp 경로를 적는거라고 한다.
//		if(memberId != null)
//			return "/review/reviewDetail.do?reviewNo=" + reviewNo + "&memberId=" + memberId;
//		else
//			return "/review/reviewDetail.do?reviewNo=" + reviewNo;
		return "review/reviewDetail";
	}
	
	
	@ResponseBody
	@PostMapping("/heartButton.do")
	public int heart(ReviewLike reviewLike, HttpServletRequest httpRequest) throws Exception {

        log.debug("reviewLike = {}", reviewLike);
        
        int heart = Integer.parseInt(httpRequest.getParameter("heart"));
        log.debug("heart = {}", heart);
		
		if(heart >= 1) { 
			int deleteResult = reviewService.deleteReviewLike(reviewLike);
			log.debug("deleteResult = {}", deleteResult);
			heart = 0; 
		} 
		else {
			int insertResult = reviewService.insertReviewLike(reviewLike);
			log.debug("insertResult = {}", insertResult);
			heart = 1; 
		}

        return heart;
	}
	
	
	
	
	@GetMapping("/reviewUpdate.do")
	public void reviewUpdate(@RequestParam int reviewNo, Model model) {
		log.debug("reviewNo = {}", reviewNo);
		
		// 업무로직
		Review review = reviewService.selectOneReviewCollection(reviewNo);   // mapper에서 collection 써서 한번에 조회
		log.debug("review = {}", review);   
		
		model.addAttribute("review", review);
	}
	
	
	@PostMapping("/reviewUpdate.do")
	public String reviewUpdate(
			Review review, 
			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles, 
			@RequestParam(required=false) int[] delFile,
			RedirectAttributes redirectAttr
		) throws IllegalStateException, IOException {
		
		try {
			log.debug("review = {}", review);
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
				
					// 2. DB에 attachment 레코드 등록
					Attachment attach = new Attachment();
					attach.setReviewNo(review.getReviewNo());
					attach.setRenamedFilename(renamedFilename);
					attach.setOriginalFilename(originalFilename);
					attachments.add(attach);
					
				}
			}
			
			// 업무로직
			int result = 0;
			// 기존 첨부파일 삭제
			if(delFile != null) {
				for(int i = 0; i  < delFile.length; i++) {

					// 서버컴퓨터에서 파일 삭제
					Attachment attach = reviewService.selectOneAttachment(delFile[i]);
					log.debug("attach = {}", attach);
					
					File targetFile = new File(saveDirectory, attach.getRenamedFilename());
					targetFile.delete();
					
					// db에서 삭제
					result = reviewService.deleteAttachment(delFile[i]);
					log.debug("result = {}", result);
					
				}
			}
			
			if(!attachments.isEmpty())
				review.setAttachments(attachments);
			
			result = reviewService.updateReview(review);
//			String msg = result > 0 ? "게시글 등록 성공!" : "게시글 등록 실패!";
//			redirectAttr.addFlashAttribute("msg", msg);
		} catch (Exception e) {
			log.error(e.getMessage(), e);   // 로깅
			throw e;   // spring container에게 던짐
		}
		
		return "redirect:/review/reviewDetail.do?reviewNo=" + review.getReviewNo();
	}
	
	@PostMapping("reviewDelete.do")
	public String reviewDelete(@RequestParam int reviewNo) {
		log.debug("reviewNo = {}", reviewNo);
		
		// 전달된 리뷰글번호로 글 찾아서 가져옴
		Review review = reviewService.selectOneReviewCollection(reviewNo);
		
		// 찾아온 리뷰글의 첨부파일 목록
		List<Attachment> attachList = review.getAttachments();
		log.debug("attachList = {}", attachList);
		
		String saveDirectory = application.getRealPath("/resources/upload/board");
		
		for(Attachment attach : attachList) {
			log.debug("attach = {}", attach);
			if(attach.getAttachNo() != 0) {
				File targetFile = new File(saveDirectory, attach.getRenamedFilename());
				targetFile.delete();
			}
		}
		
		
		int result = reviewService.deleteReview(reviewNo); 
		log.debug("result = {}", result);
				
		return "redirect:/review/reviewList.do";
	}
	
	
	@PostMapping("/reviewCommentEnroll.do")
	public String reviewCommentEnroll(ReviewComment reviewComment) {
		log.debug("revieComment = {}", reviewComment);
		
		int result = reviewService.insertReviewComment(reviewComment);
		log.debug("result = {}", result);
		
		return "redirect:/review/reviewDetail.do?reviewNo=" + reviewComment.getReviewNo();
	}
	
	
	@PostMapping("/reviewCommentDelete.do")
	public String reviewCommentDelete(@RequestParam int no, @RequestParam int reviewNo) {
		log.debug("no = {}", no);
		
		int result = reviewService.deleteReviewComment(no);
		log.debug("result = {}", result);
		
		return "redirect:/review/reviewDetail.do?reviewNo=" + reviewNo;
	}
	
	
}
 