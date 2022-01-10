package com.kh.spring.goods.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.common.HiSpringUtils;
import com.kh.spring.goods.model.service.GoodsService;
import com.kh.spring.goods.model.vo.CartJoin;
import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.goods.model.vo.GoodsCart;
import com.kh.spring.goods.model.vo.GoodsJoin;
import com.kh.spring.goods.model.vo.GoodsLike;
import com.kh.spring.goods.model.vo.GoodsLikeJoin;
import com.kh.spring.goods.model.vo.GoodsOrder;
import com.kh.spring.goods.model.vo.OptionDetail;
import com.kh.spring.goods.model.vo.OrderDetail;
import com.kh.spring.goods.model.vo.OrderDetailJoin;
import com.kh.spring.goods.model.vo.OrderJoin;
import com.kh.spring.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	/**
	 * 상품 목록 페이지
	 */
	@GetMapping("/goodsList.do")
	public String goodsList(
			@RequestParam(defaultValue = "1") int cPage, Model model, 
			HttpServletRequest request, 
			Authentication authentication
		) {

		HttpSession session = request.getSession();
		
		Map<String, Object> param = new HashMap<>();
		
		
		if(authentication != null) {
			// 로그인 되어 있을시 로그인한 아이디 넣기
			param.put("loginId", (String)(((Member) authentication.getPrincipal()).getId()));
		} else {
			// 로그인 안되어 있을시 세션 아이디 넣기 
			param.put("loginId", session.getId());
		}
		
		// 로그인X -> param = {loginId=441129F1C9D26CF52CF5155665EEFBC3}
		// 로그인O -> param = {loginId=abcde}
		//log.debug("param = {}", param); 
		
		// 현재 페이지 번호 
		//log.debug("cPage = {}", cPage);
		
		// limit : 한페이지에 표시할 게시글 수 
		// offset : 건너뛰어야 할 게시글 수
		int limit = 10;
		int offset = (cPage - 1) * limit;
		param.put("limit", limit);
		param.put("offset", offset);
		
		
		// 1. 상품 리스트 
		List<GoodsLikeJoin> list = goodsService.selectGoodsList(param);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		// 2. 전체게시물수 
		int totalContent = goodsService.selectGoodsTotalCount();
		model.addAttribute("totalContent", totalContent);
		
		// 3. 페이지바
		String url = request.getRequestURI(); 
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("pagebar", pagebar);
		
		return "goods/goodsList";
	}
	
	/**
	 * 상품 상세 페이지
	 */
	@GetMapping("/goodsDetail.do")
	public void goodsDetail(@RequestParam int pid, Model model, HttpServletRequest request) {
		// 상품 아이디 확인 
		log.debug("pid = {}", pid);
		
		// pid -> GoodsJoin (Goods+GoodsOptioin+OptionDetail)
		List<GoodsJoin> list = goodsService.selectOneGoodsDetail(pid);
		log.debug("list = {}", list);
		
		List<OptionDetail> optionDetail = new ArrayList<>();
		
		for(int i=0; i < list.size(); i++ ) {
			optionDetail.add(list.get(i).getOptionDetail());
		}
		
		Goods goods = list.get(0).getGoods();
		
		log.debug("optionDetail = {}", optionDetail);
		log.debug("goods = {}", goods);
		
		model.addAttribute("goods", goods);
		model.addAttribute("optionDetail", optionDetail);
		request.setAttribute("optionDetail", optionDetail);
		
		// [기종 -> 색상] 최초 옵션리스트
		List<OptionDetail> colorList = goodsService.selectColorByFirstType(pid);
		request.setAttribute("colorList", colorList);
		
		// [색상 -> 사이즈] 최초 옵션리스트
		List<OptionDetail> sizeList = goodsService.selectSizeByFirstColor(pid);
		request.setAttribute("sizeList", sizeList);
		
	}
	
	/**
	 * [기종] 선택 -> [색상] 옵션리스트 뿌리기
	 */
	@PostMapping("/selectColorByType.do")
	public String selectColorByType(@RequestParam String goodsId, @RequestParam String optionType, Model model) {
		log.debug("goodsId = {}", goodsId);
		log.debug("optionType = {}", optionType);
		
		Map<String, Object> map = new HashMap<>();
		map.put("goodsId", goodsId);
		map.put("optionType", optionType);
		
		List<OptionDetail> searchColorList = goodsService.selectColorByType(map);
		log.debug("searchColorList = {}", searchColorList);
		
		model.addAttribute("searchColorList", searchColorList);
	
		return "goods/optionColorDiv";
	}
	
	/**
	 * [색상] 선택 -> [사이즈] 옵션리스트 뿌리기
	 */
	@PostMapping("/selectSizeByColor.do")
	public String selectSizeByColor(@RequestParam String goodsId, @RequestParam String optionColor, Model model) {
		log.debug("goodsId = {}", goodsId);
		log.debug("optionColor = {}", optionColor);
		
		Map<String, Object> map = new HashMap<>();
		map.put("goodsId", goodsId);
		map.put("optionColor", optionColor);
		
		List<OptionDetail> searchSizeList = goodsService.selectSizeByColor(map);
		log.debug("searchSizeList = {}", searchSizeList);
		
		model.addAttribute("searchSizeList", searchSizeList);
	
		return "goods/optionSizeDiv";
	}
	
	/**
	 * goodsDetail 페이지 > preview 이미지 찾기 
	 */
	@PostMapping("/selectOneImg.do")
	public String selectOneImg(@RequestParam Map<String, Object> map, Model model) {
		log.debug("map = {}", map);
		
		OptionDetail img = goodsService.selectOneOptionDetail(map);
		log.debug("프리뷰 이미지 찾기 = {}", img);
		
		model.addAttribute("img", img);
	
		return "goods/previewImgDiv";
	}
	
	/**
	 * 장바구니 등록
	 * 
	 * - 상품아이디, 회원아이디, 옵션아이디 동일시 상품개수만 더하기 처리함 (update)
	 */
	@PostMapping("/InsertCart.do")
	public ResponseEntity<?> InsertCart(@RequestParam Map<String, Object> map) {
		try {
			log.debug("map = {}", map);
			String pId = (String) map.get("goodsId");
			String memberId = (String) map.get("memberId");
			String cartQty = (String) map.get("goodsQty");
			
			log.debug("pId = {}", pId);
			log.debug("memberId = {}", memberId);
			log.debug("cartQty = {}", cartQty);
			
			//옵션아이디찾기
			int optionId = goodsService.selectOneOptionId(map);
			log.debug("optionId = {}", optionId);
			
			// update, insert에 사용할 매개변수 map 
			Map<String, Object> param = new HashMap<>();
			param.put("optionId", optionId);
			param.put("pId", pId);
			param.put("memberId", memberId);
			param.put("cartQty", cartQty);
			
			
			// cart_id, option_id, member_id -> 기존 cart 객체 있는지 찾기 
			//int CartId = goodsService.selectOneCartId(param); // CartId = 41, 널포인터인셉션
			GoodsCart cart = goodsService.selectOneCart(param);
			log.debug("cart = {}", cart); 
			//log.debug("cart.getCartId() = {}", cart.getCartId()); 
			
			
			int result = 0;
			
			if(cart != null) {
				// 찾은 cart 객체가 있으면 update 처리하기 
				param.put("cartId", cart.getCartId());
				result = goodsService.updateCartQty(param);
				
			} else {
				// 찾은 cart 객체가 없으면(null) insert 처리하기
				result = goodsService.insertCart(param);
			}
			
			log.debug("result = {}", result);
			
			
			// 사용자 피드백 메세지 
			Map<String, Object> msg = new HashMap<>();
			
			if(result>0) {
				msg.put("msg", "상품을 장바구니에 담았습니다.");
			}
			else {
				msg.put("msg", "장바구니 담기 실패");
			}
			
			return ResponseEntity.ok(msg);
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return ResponseEntity
				.status(HttpStatus.INTERNAL_SERVER_ERROR)
				.build();
		}	
	}
	
	/**
	 * 장바구니 페이지 
	 */
	@GetMapping("/goodsCart.do")
	public String goodsCart(Authentication authentication, Model model, HttpServletRequest request) {
		
		log.debug("authentication = {}", authentication);
		
		Member member = (Member) authentication.getPrincipal();
		log.debug("[principal] member = {}", member);
		
		// 장바구니 DB 조회
		List<CartJoin> list = goodsService.selectGoodsCartList(member.getId());
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		request.setAttribute("list", list);
		
		return "goods/goodsCart";
	}
	
	/**
	 * 장바구니 레코드 삭제 
	 */
	@PostMapping("/deleteCart.do")
	public String deleteCart(@RequestParam String cartId, RedirectAttributes redirectAttr) {
		log.debug("cartId = {}", cartId);
		
		int result = goodsService.deleteCart(cartId);
		log.debug("장바구니 삭제 result = {}", result);
		
		redirectAttr.addFlashAttribute("msg", "장바구니 삭제 성공!");
		
		return "redirect:/goods/goodsCart.do";
	}
	
	
	/**
	 * 판매자정보 페이지 
	 */
	@GetMapping("/sellerInfo.do")
	public String sellerInfo(Model model) {
		
		// 1. 굿즈샵 이용률 구하기
		
		//// 1-1. 전체회원수
		int memberAllCnt = goodsService.selectAllMemberCount();
		log.debug("memberAllCnt = {}", memberAllCnt); // 49
		
		//// 1-2. 주문한회원수
		int orderMemberCnt = goodsService.selectOrderMemberCount();
		log.debug("orderMemberCnt = {}", orderMemberCnt); // 4
		
		//// 1-3. 굿즈샵 이용율
		double usingPercent = ((double)orderMemberCnt/memberAllCnt)*100;
		log.debug("usingPercent = {}", usingPercent);
		model.addAttribute("usingPercent", usingPercent);
		
		/////////////////////////////
		
		// 2. 굿즈샵 주문자들의 나이대별 회원수 구하기 
		List<String> ageList = goodsService.selectAgeNumber();
		log.debug("ageList = {}", ageList); // ageList = [12, 20, 22, 25]
		
		Map<String, Integer> ageMap = new HashMap<>();
		ageMap.put("10대", 0);
		ageMap.put("20대", 0);
		ageMap.put("30대", 0);
		ageMap.put("40대", 0);
		ageMap.put("50대", 0);
		
		for(int i=0; i<ageList.size(); i++) {
			
			switch(ageList.get(i).substring(0, 1)) {
			case "1": ageMap.put("10대", ageMap.get("10대")+1); break;
			case "2": ageMap.put("20대", ageMap.get("20대")+1); break;
			case "3": ageMap.put("30대", ageMap.get("30대")+1); break;
			case "4": ageMap.put("40대", ageMap.get("40대")+1); break;
			case "5": ageMap.put("50대", ageMap.get("50대")+1); break;
			
			}
		}
		log.debug("ageMap = {}", ageMap); 
		model.addAttribute("ageMap", ageMap);
		
		return "goods/sellerInfo";
	}
	
	
	
	/**
	 * 장바구니 [수량 변경] 모달  
	 */
	@GetMapping("/goodsCartQtyModal.do")
	public String goodsCartQtyModal(@RequestParam String id, Model model) {
		log.debug("id = {}", id);
		
		// 장바구니 DB 조회
		CartJoin cart = goodsService.selectGoodsCartQtyModal(id);
		log.debug("cart = {}", cart);
		
		model.addAttribute("cart", cart);
		
		
		return "goods/goodsCartQtyModal";
	}
	
	
	/**
	 * 장바구니 모달 [확인] 버튼 (장바구니 수량 변경)  
	 * {cartId : cartId, qty : qty}
	 */
	@GetMapping("/updateCart.do")
	public String updateCart(@RequestParam String cartId, @RequestParam String qty) {
		log.debug("cartId = {}", cartId);
		log.debug("qty = {}", qty);
		
		Map<String, Object> map = new HashMap<>();
		map.put("cartId", cartId);
		map.put("qty", qty);
		
		
		// 장바구니 수량 변경
		int result = goodsService.updateCart(map);
		log.debug("장바구니 수량 변경 result = {}", result);
		
		
		return "redirect:/goods/goodsCart.do";
	}
		
	/**
	 * 상품상세페이지 로드시 좋아요 버튼 데이터 찾기 
	 */
	@PostMapping("/selectGoodsLike.do")
	public String selectGoodsLike(@RequestParam Map<String, Object> map, HttpServletRequest request, Model model) {
		log.debug("map = {}", map); // map = {_csrf=5961090e-f0ea-48b2-bcab-3fd08a4fc787, goodsId=69, memberId=abcde}
		
		String goodsId = (String) map.get("goodsId");	
		String memberId = (String) map.get("memberId");

		//log.debug("goodsId = {}", goodsId); // goodsId = 69
		//log.debug("memberId = {}", memberId); // memberId = abcde 또는 "" 
		
		HttpSession session = request.getSession();
		String sessionId = session.getId();
		log.debug("세션아이디 = {}", sessionId);
		
		// 회원 아이디 
		String userId ="";
		
		if(memberId == "") {
			userId = sessionId;
		}else {
			userId = memberId;
		}
		
		Map<String, Object> param = new HashMap<>();
		param.put("pId", goodsId);
		param.put("userId", userId);
		
		
		// 로그인 안하면 -> {pid=69, userId=06B7864EDD3E6299CC717E3B757ECF48}
		// 로그인 하면 -> {pid=69, userId=abcde}
		log.debug("selectGoodsLike의 param = {}", param); 
		
		// 업무로직 
		GoodsLike like = goodsService.selectOneGoodsLike(param);
		log.debug("like = {}", like); // GoodsLike(goodsLikeId=21, pId=69, userId=abcde) 또는 null 
		
		if(like != null) {
			model.addAttribute("like", 1);
		} else {
			model.addAttribute("like", 0);
		}
		log.debug("model 데이터 = {}", model.toString()); 
		
		return "goods/goodsLikeDiv";
	}
	
	
	
	/**
	 * 좋아요 버튼 클릭시 update 처리 
	 * 빈하트는 far / 풀하트는 fas 
	 */
	@PostMapping("/updateGoodsLike.do")
	public String updateGoodsLike(@RequestParam Map<String, Object> map, HttpServletRequest request, Model model) {
		log.debug("map = {}", map); // map = {_csrf=a5ce0b62-0ce7-4a8b-bc91-7a6b40548fe5, goodsId=69, memberId=, heartClass=far fa-heart}
		
		// 업무로직 매개변수로 사용할 map 
		Map<String, Object> param = new HashMap<>();
		param.put("pId", map.get("goodsId"));
		
		HttpSession session = request.getSession();
		
		//memberId값 없으면 세션아이디값 넣기 
		if(map.get("memberId") == "") {
			param.put("userId", session.getId());
		}else {
			param.put("userId", map.get("memberId"));
		}
		
		log.debug("param = {}", param); 
		
		int result = 0;
		
		String heartClass = (String) map.get("heartClass");
		//빈하트이면 레코드 추가하고 like 1로 하기 
		if(heartClass.contains("far")) {
			result = goodsService.insertGoodsLike(param);
			model.addAttribute("like", 1);
		}
		
		
		//풀하트이면 레코드 삭제하고 like 0으로 하기 
		if(heartClass.contains("fas")) {
			result = goodsService.deleteGoodsLike(param);
			model.addAttribute("like", 0);
		}
		
		return "goods/goodsLikeDiv";
	}

	/**
	 * 주문, 주문상세 데이터 추가 (사용안함)  
	 * 
	 * insertPayment에 통합함 
	 */
	@GetMapping("/insertOrder.do")
	public void insertOrder(Authentication authentication) {


		// 1. 주문 테이블에 레코드 1행 추가하기 
		// 회원아이디 : memberId
		Member member = (Member) authentication.getPrincipal();
		String memberId = member.getId();
		log.debug("memberId = {}", memberId);
		
		// 총주문금액 
		List<CartJoin> list = goodsService.selectGoodsCartList(memberId);
		log.debug("list = {}", list);
		
		int totalPrice = 0;
		int price = 0;
		int cnt = 0;
		
		for(int i=0; i < list.size(); i++ ) {
			price = list.get(i).getGoods().getPPrice();
			cnt = list.get(i).getGoodsCart().getCartQuantity();
					
			totalPrice += (price*cnt);
		}
		log.debug("totalPrice = {}", totalPrice); // totalPrice = 321100 (배송비 포함X)
		
		// 매개변수
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", memberId);
		param.put("totalPrice", totalPrice);
		
		// goods_order 테이블에 1행 추가 / param : memberId, totalPrice
		int result = goodsService.insertGoodsOrder(param);
		log.debug("goods_order 삽입 result = {}", result); // goods_order 삽입 result = 1
		
		////////////////////////////////////////////
		
		// 2. 주문상세 테이블에 레코드 n행 추가하기 
		
		// 주문번호 찾기 
		String orderNo = goodsService.selectOneOrderNo(param);
		log.debug("orderNo = {}", orderNo); // order = order-0004
		param.put("orderNo", orderNo);
		
		// order_detail 테이블에 n행 추가 / param : memberId, orderNo
		result = goodsService.insertOrderDetail(param);
		log.debug("order_detail 삽입 result = {}", result); // order_detail 삽입 result = 6
		

		//return "redirect:/goods/goodsCart.do";
	}
	
	/**
	 * 주문서 페이지
	 */
	@GetMapping("/goodsOrder.do")
	public String goodsOrder(Authentication authentication, Model model) {
		
		// member -> 주문자정보 
		Member member = (Member) authentication.getPrincipal();
		String memberId = member.getId();
		model.addAttribute("member", member);
		
		// cart -> 주문정보
		List<CartJoin> cartList = goodsService.selectGoodsCartList(memberId);
		log.debug("cartList = {}", cartList);
		model.addAttribute("cartList", cartList);
		
		return "goods/goodsOrder";
	}
	
	/**
	 * [결제하기]버튼 클릭시

	 	memberId: "abcde"
		receiver: "알파벳"
		receiverPhone: "01012345678"
		
		postCode: "28456"
		address: "충북 청주시 흥덕구 1순환로 384"
		detailAddress: "한신빌라 103-22"
		orderComment: "부재시 전화 주시거나 문자 남겨주세요." 또는 ""
		booleanSaveAddressChk: 1
		
		totalPrice: "47000" <- 상품가격만
		payPrice: "41500" <- 상품가격(47000) - 사용한포인트(8000) + 배송비(2500)
		usedPoints: "8000" <- 사용한 포인트 (또는 "")
		
		cardName : 신한카드
		cardNumber : 941061*********8
	 */
	@PostMapping("/insertPayment.do")
	public String insertPayment(@RequestParam Map<String, Object> map) {
		log.debug("map = {}", map);
		
		int result = 0;
		
		// goods_order 테이블에 1행 추가 / 필요 map : memberId, payPrice
		result = goodsService.insertGoodsOrder(map);
		log.debug("goods_order 삽입 result = {}", result); 
		
		// orderNo 찾기 
		String orderNo = goodsService.selectOneOrderNo(map);
		log.debug("orderNo = {}", orderNo);
		map.put("orderNo", orderNo);
		
		
		// order_detail 테이블에 n행 추가 / 필요 map : memberId, orderNo
		result = goodsService.insertOrderDetail(map);
		log.debug("order_detail 삽입 result = {}", result);
					
		
		if(map.get("usedPoints").toString() == "") {
			map.put("usedPoints", "0");
		}
		
		// payment 테이블 insert
		result = goodsService.insertPayment(map);
		log.debug("payment insert > result = {}", result);
		
		// 결제 성공 및 결제 데이터 추가 성공시 
		if(result > 0) {

			int booleanSaveAddressChk = Integer.parseInt(map.get("booleanSaveAddressChk").toString());
			int usedPoints = Integer.parseInt(map.get("usedPoints").toString());
			int change = -usedPoints;
			
			log.debug("booleanSaveAddressChk = {}", booleanSaveAddressChk);
			log.debug("usedPoints = {}", usedPoints);
			
			// member 테이블 주소 update
			if(booleanSaveAddressChk > 0) {
				result = goodsService.updateMemberAddress(map);
				log.debug("member address update > result = {}", result);
			}

			// member 테이블 포인트 update
			if(usedPoints > 0) {
				result = goodsService.updateMemberPoint(map);
				log.debug("member point update > result = {}", result);
			}
			
			// goods 테이블 재고량 update (order_no -> order_detail_no -> option_id)
			List<OrderDetail> orderDetail = goodsService.selectOrderDetailList(orderNo);
			log.debug("orderDetail = {}", orderDetail);
			
			orderDetail.get(0).getOptionId();
			
			result = goodsService.updateGoodsStock(orderDetail);
			log.debug("updateGoodsStock > result = {}", result);
			
			// cart 테이블 전체 delete
			result = goodsService.deleteCartList(map);
			log.debug("cart delete > result = {}", result);
			
			// point_history 테이블 insert
			map.put("reason", "굿즈샵 포인트 사용");
			map.put("change", change);
			map.put("point", 0);
			
			result = goodsService.insertPointHistoryByPayment(map);
			log.debug("point history insert > result = {}", result);
						
		}

		return "redirect:/goods/completeOrder.do";
	}
	
	
	/**
	 * 결제완료 페이지 
	 */
	@GetMapping("/completeOrder.do")
	public String completeOrder(Authentication authentication, Model model) {
		Member member = (Member) authentication.getPrincipal();
		
		GoodsOrder order = goodsService.selectOneGoodsOrder(member.getId());
		log.debug("order = {}", order);
		model.addAttribute("order", order);
		
		return "goods/completeOrder";
	}
	
	
	/**
	 * 주문 목록 페이지 
	 * 
	 * 주문(goods_order) 주문상세(order_detail) + 굿즈(goods) + 옵션상세(option_detail)
	 */
	@GetMapping("/orderList.do")
	public String orderList(Authentication authentication, Model model) {
		
		Member member = (Member) authentication.getPrincipal();
		String memberId = member.getId();
		
		List<OrderJoin> list = goodsService.selectOrderList(memberId);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		return "goods/orderList";
	}
	
	
	/**
	 * 주문 상세 페이지 
	 */
	@GetMapping("/orderDetail.do")
	public String orderDetail(@RequestParam int no, Model model) {
		
		// 주문상세번호 
		int orderDetailNo = no;
		log.debug("orderDetailNo = {}", orderDetailNo);
		
		// 주문상세번호 -> 주문번호 찾기 
		int orderNo = goodsService.selectOrderNo(orderDetailNo);
		log.debug("orderNo = {}", orderNo);
		
		// 주문번호 -> 첫번째 주문상세번호 찾기 
		int firstOrderDetailNo = goodsService.selectFirstOrderDetailNo(orderNo);
		log.debug("firstOrderDetailNo = {}", firstOrderDetailNo);
		
		// 주소의 주문상세번호 == 찾은첫번째주문상세번호 -> firstOrderDetailItem = 1 (아니면 0)
		int booleanFirstOrder = (orderDetailNo == firstOrderDetailNo) ? 1 : 0 ;
		model.addAttribute("booleanFirstOrder", booleanFirstOrder);
		log.debug("booleanFirstOrder = {}", booleanFirstOrder);
		
		// 주문상세번호 -> 주문+주문상세+결제+굿즈+옵션상세 
		OrderDetailJoin order = goodsService.selectOneOrderDetailJoin(orderDetailNo);
		model.addAttribute("order", order);
		log.debug("order = {}", order);
		
		// status 데이터 -> statusPercent 상품상태 프로그레스바 퍼센티지 
		String status = order.getOrderDetail().getStatus();
		int statusPercent = 20;
		
		switch(status) {
			case "주문취소" : statusPercent = 0; break;
			case "상품준비중" : statusPercent = 20; break;
			case "배송준비중" : statusPercent = 40; break;	
			case "배송중" : statusPercent = 60; break;
			case "배송완료" : statusPercent = 80; break;
			case "구매확정" : statusPercent = 100; break;
		}
		
		log.debug("statusPercent = {}", statusPercent);
		model.addAttribute("statusPercent", statusPercent);
		
		return "goods/orderDetail";
	}
	
	
	/**
	 * 관심상품 페이지 
	 */
	@GetMapping("/likeItems.do")
	public String likeItems(Authentication authentication, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String loginId = "";
		
		if(authentication != null) {
			// 로그인 되어 있을시 로그인한 아이디 넣기
			loginId = (String)(((Member) authentication.getPrincipal()).getId());
		} else {
			// 로그인 안되어 있을시 세션 아이디 넣기 
			loginId = session.getId();
		}
		
		List<GoodsLikeJoin> list = goodsService.selectGoodsLikeItems(loginId);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		
		return "goods/likeItems";
	}
	
	/**
	 * 굿즈 목록 정렬
	 */
	@PostMapping("/goodsListSort.do")
	public String goodsListSort(@RequestParam String sortType, @RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request, Authentication authentication) {
		
		log.debug("sortType = {}", sortType);
		
		
		HttpSession session = request.getSession();
		
		Map<String, Object> param = new HashMap<>();
		param.put("sortType", sortType);
		
		if(authentication != null) {
			param.put("loginId", (String)(((Member) authentication.getPrincipal()).getId()));
		} else {
			param.put("loginId", session.getId());
		}
		
		int limit = 10;
		int offset = (cPage - 1) * limit;
		param.put("limit", limit);
		param.put("offset", offset);
		
		
		// 1. 상품 리스트 
		List<GoodsLikeJoin> list = goodsService.selectGoodsListBySortType(param);
		
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		// 2. 전체게시물수 
		int totalContent = goodsService.selectGoodsTotalCount();
		model.addAttribute("totalContent", totalContent);
		
		// 3. 페이지바
		String url = request.getRequestURI(); 
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("pagebar", pagebar);
		
		
		return "goods/goodsListSortDiv";
	}
	
	
	/**
	 * goodsDetail 페이지 > 옵션별 재고량 찾기  
	 */
	@PostMapping("/selectGoodsOptionStock.do")
	public String selectGoodsOptionStock(@RequestParam Map<String, Object> map, Model model) {
		log.debug("map = {}", map);
		
		OptionDetail optionDetail = goodsService.selectOneOptionDetail(map);
		log.debug("optionDetail = {}", optionDetail);
		log.debug("옵션 재고량 = {}", optionDetail.getOptionStock());
		
		model.addAttribute("optionDetail", optionDetail);
	
		return "goods/soldoutDiv";
	}
	
	
}
