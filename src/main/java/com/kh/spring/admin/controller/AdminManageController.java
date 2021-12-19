package com.kh.spring.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.admin.model.service.AdminService;
import com.kh.spring.common.HiSpringUtils;
import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.sharing.model.vo.Attachment;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminManageController {
	
	@Autowired
	private AdminService adminService;

	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/adminManage.do")
	public void adminManage() {}

	/**
	 * [상영 영화 목록] 
	 */
	
//	@GetMapping("/adminMovieList.do")
//	public void adminMovieList(Model model) {
//		List<Movie> list = adminService.selectMovieList();
//		log.debug("list = {}", list);
//		model.addAttribute("list", list);
//	}
	
	/**
	 * [굿즈 목록]
	 */
	
	@GetMapping("/adminGoodsList.do")
	public void adminGoodsList(Model model) {
		List<Goods> list = adminService.selectGoodsList();
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
	}
	
	/**
	 * [굿즈 추가]
	 */

	@RequestMapping(value="/adminGoodsInsert.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String adminGoodsInsert(Goods goods, 
			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles, 
			RedirectAttributes redirectAttr	
		) throws IllegalStateException, IOException {
		
		try {
			log.debug("goods = {}", goods);
			
			// 첨부파일 list생성
			List<Attachment> attachments = new ArrayList<>();
			
			// application객체(ServletContext)
			String saveDirectory = application.getRealPath("/resources/upload/goods");
			log.debug("saveDirectory = {}", saveDirectory);
			
			for(MultipartFile upFile : upFiles) {
	
				if(!upFile.isEmpty() && upFile.getSize() != 0) {
					
					log.debug("upFile = {}", upFile);
					log.debug("upFile.name = {}", upFile.getOriginalFilename());
					log.debug("upFile.size = {}", upFile.getSize());
					
					String originalFilename = upFile.getOriginalFilename();
	
					// 1. 서버컴퓨터에 저장
					File dest = new File(saveDirectory, originalFilename);
					log.debug("dest = {}", dest);
					upFile.transferTo(dest);
					
					// 2. DB에 attachment 레코드 등록
					Attachment attach = new Attachment();
					attach.setRenamedFilename(originalFilename);
					attach.setOriginalFilename(originalFilename);
					attachments.add(attach);
				}
			}
			
			// 업무로직
			if(!attachments.isEmpty())
				goods.setAttachments(attachments);
			
			int result = adminService.insertGoods(goods);
			
			String msg = result > 0 ? "상품 등록 성공" : "다시 시도해주세요.";
			
			redirectAttr.addFlashAttribute("msg", msg);
		} catch (Exception e) {
			log.error(e.getMessage(), e); // 로깅
			
			throw e; // spring container에게 던짐.
		}
		return "redirect:/admin/adminGoodsList.do";
	}
	
}
