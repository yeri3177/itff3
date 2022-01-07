package com.kh.spring.common;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;


import com.kh.spring.notify.model.service.NotifyService;

public class HiSpringUtils {
	
//	@Autowired
////	private static JavaMailSender mailSender;
	
	/**
	 * 
	 *  
	 * @param cPage
	 * @param numPerPage
	 * @param totalContents
	 * @param url
	 * @return
	 */
	public static String getPagebar(int cPage, int numPerPage, int totalContents, String url) {
		StringBuilder pagebar = new StringBuilder();
		
		// 전체페이지수 
		int totalPage = (int) Math.ceil((double) totalContents / numPerPage);
		
		// 페이지번호를 클릭했을때 링크
		String delimeter = url.contains("?") ? "&" : "?";
		url = url + delimeter + "cPage="; // /spring/board/boardList.do?cPage=
		
		// 페이지바크기 
		int pagebarSize = 5;
		
		/* 
		 		1 2 3 4 5 >>
		 		
		 	<<	6 7 8 9 10 >>
		 	
		 	<< 11 12
		 	
		 	pageStart : 시작하는 pageNo
		 		- cPage와 pagebarSize에 의해 결정
		 */
		int pageStart = (cPage - 1) / pagebarSize * pagebarSize + 1;
		int pageEnd = pageStart + pagebarSize - 1;
		
		int pageNo = pageStart;
		
		/*
		 <nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		    <li class="page-item disabled">
		      <a class="page-link" href="#" aria-label="Previous" tabindex="-1">
		        <span aria-hidden="true">&laquo;</span>
		        <span class="sr-only">Previous</span>
		      </a>
		    </li>
		    
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		        <span class="sr-only">Next</span>
		      </a>
		    </li>
		  </ul>
		</nav>
		<script>
		const paging = (cPage) => {
			location.href = url + cPage;
		}
		</script>
		
		 */
		
		pagebar.append("<nav aria-label=\"Page navigation example\">\n"
				+ "		  <ul class=\"pagination justify-content-center\">\n");
		
		// 1.이전
		if(pageNo == 1) {
			pagebar.append("<li class=\"page-item disabled\">\r\n"
					+ "		      <a class=\"page-link\" href=\"#\" aria-label=\"Previous\" tabindex=\"-1\">\r\n"
					+ "		        <span aria-hidden=\"true\">&laquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Previous</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		else {
			pagebar.append("<li class=\"page-item \">\r\n"
					+ "		      <a class=\"page-link\" href=\"javascript:paging(" + (pageNo - 1) + ")\" aria-label=\"Previous\" >\r\n"
					+ "		        <span aria-hidden=\"true\">&laquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Previous</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		
		// 2.pageNo
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			if(pageNo == cPage) {
				// 현재페이지인 경우 링크 제공안함.
				pagebar.append("<li class=\"page-item active\"><a class=\"page-link\">" + pageNo + "<span class=\"sr-only\">(current)</span></a></li>\n");
			}
			else {
				// 현재페이지가 아닌 경우 링크를 제공.
				pagebar.append("<li class=\"page-item\"><a class=\"page-link\" href=\"javascript:paging(" + pageNo + ")\">" + pageNo + "</a></li>\n");
			}
			
			pageNo++;
		}
		
		// 3.다음
		if(pageNo > totalPage) {
			pagebar.append("<li class=\"page-item disabled\">\r\n"
					+ "		      <a class=\"page-link\" href=\"#\" tabindex=\"-1\" aria-label=\"Next\">\r\n"
					+ "		        <span aria-hidden=\"true\">&raquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Next</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		else {
			pagebar.append("<li class=\"page-item\">\r\n"
					+ "		      <a class=\"page-link\" href=\"javascript:paging(" + pageNo + ")\" aria-label=\"Next\">\r\n"
					+ "		        <span aria-hidden=\"true\">&raquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Next</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		
		pagebar.append("		  </ul>\r\n"
				+ "		</nav>\r\n"
				+ "		<script>\r\n"
				+ "		const paging = (cPage) => {\r\n"
				+ "			location.href = '" + url + "' + cPage;\r\n"
				+ "		}\r\n"
				+ "		</script>\n");
		
		return pagebar.toString();
	}
	
	
	// 리뷰게시판용 페이지바 메소드. pagebarSize가 10임
	public static String getReviewPagebar(int cPage, int numPerPage, int totalContents, String url) {
		StringBuilder pagebar = new StringBuilder();
		
		// 전체페이지수 
		int totalPage = (int) Math.ceil((double) totalContents / numPerPage);
		
		// 페이지번호를 클릭했을때 링크
		String delimeter = url.contains("?") ? "&" : "?";
		url = url + delimeter + "cPage="; // /spring/board/boardList.do?cPage=
		
		// 페이지바크기 
		int pagebarSize = 10;
		
		/* 
		 	pageStart : 시작하는 pageNo
		 		- cPage와 pagebarSize에 의해 결정
		 */
		int pageStart = (cPage - 1) / pagebarSize * pagebarSize + 1;
		int pageEnd = pageStart + pagebarSize - 1;
		
		int pageNo = pageStart;
		
		/*
		 <nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		    <li class="page-item disabled">
		      <a class="page-link" href="#" aria-label="Previous" tabindex="-1">
		        <span aria-hidden="true">&laquo;</span>
		        <span class="sr-only">Previous</span>
		      </a>
		    </li>
		    
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		        <span class="sr-only">Next</span>
		      </a>
		    </li>
		  </ul>
		</nav>
		<script>
		const paging = (cPage) => {
			location.href = url + cPage;
		}
		</script>
		
		 */
		
		pagebar.append("<nav aria-label=\"Page navigation example\">\n"
				+ "		  <ul class=\"pagination justify-content-center\">\n");
		
		// 1.이전
		if(pageNo == 1) {
			pagebar.append("<li class=\"page-item disabled\">\r\n"
					+ "		      <a class=\"page-link\" href=\"#\" aria-label=\"Previous\" tabindex=\"-1\">\r\n"
					+ "		        <span aria-hidden=\"true\">&laquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Previous</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		else {
			pagebar.append("<li class=\"page-item \">\r\n"
					+ "		      <a class=\"page-link\" href=\"javascript:paging(" + (pageNo - 1) + ")\" aria-label=\"Previous\" >\r\n"
					+ "		        <span aria-hidden=\"true\">&laquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Previous</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		
		// 2.pageNo
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			if(pageNo == cPage) {
				// 현재페이지인 경우 링크 제공안함.
				pagebar.append("<li class=\"page-item active\"><a class=\"page-link\">" + pageNo + "<span class=\"sr-only\">(current)</span></a></li>\n");
			}
			else {
				// 현재페이지가 아닌 경우 링크를 제공.
				pagebar.append("<li class=\"page-item\"><a class=\"page-link\" href=\"javascript:paging(" + pageNo + ")\">" + pageNo + "</a></li>\n");
			}
			
			pageNo++;
		}
		
		// 3.다음
		if(pageNo > totalPage) {
			pagebar.append("<li class=\"page-item disabled\">\r\n"
					+ "		      <a class=\"page-link\" href=\"#\" tabindex=\"-1\" aria-label=\"Next\">\r\n"
					+ "		        <span aria-hidden=\"true\">&raquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Next</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		else {
			pagebar.append("<li class=\"page-item\">\r\n"
					+ "		      <a class=\"page-link\" href=\"javascript:paging(" + pageNo + ")\" aria-label=\"Next\">\r\n"
					+ "		        <span aria-hidden=\"true\">&raquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Next</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		
		pagebar.append("		  </ul>\r\n"
				+ "		</nav>\r\n"
				+ "		<script>\r\n"
				+ "		const paging = (cPage) => {\r\n"
				+ "			location.href = '" + url + "' + cPage;\r\n"
				+ "		}\r\n"
				+ "		</script>\n");
		
		return pagebar.toString();
	}

	public static String getRenamedFilename(String originalFilename) {
		// 확장자 가져오기
		String ext = "";
		int dot = originalFilename.lastIndexOf(".");
		if(dot > -1)   // 확장자가 있다면
			ext = originalFilename.substring(dot); // .txt
		
		// 형식지정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS_");
		DecimalFormat df = new DecimalFormat("000"); // 30 -> 030
		
		// 새파일명
		return sdf.format(new Date()) + df.format(Math.random() * 999) + ext;
	}

	
	/**
	 * chat_dfslk23lskd341d 이런식으로 만들어 볼 것임
	 * 
	 * @return
	 */
	public static String getRandomChatId() {
		Random rnd = new Random();
		StringBuffer sb = new StringBuffer();
		
		for(int i = 0; i < 15; i++) {
			if(rnd.nextBoolean()) {
				// 영문자 : (아스키코드)대문자는 65~90, 소문자는 97~122
				boolean isUpperCase = rnd.nextBoolean();
				char ch = (char)((isUpperCase ? 65 : 97) + rnd.nextInt(26));
				sb.append(ch);
				
			}
			else {
				// 숫자
				sb.append(rnd.nextInt(10));
			}
		}
		
		return sb.toString();
	}
	
//	public static void mailSend(String subject, String content, String from, String to) {
//		
//        try {
//            MimeMessage mail = mailSender.createMimeMessage();
//            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
//            // true는 멀티파트 메세지를 사용하겠다는 의미
//            
//            /*
//             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
//             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
//             */
//            
//            mailHelper.setFrom(from);
//            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
//            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
//            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
//            mailHelper.setTo(to);
//            mailHelper.setSubject(subject);
//            mailHelper.setText(content, true);
//            // true는 html을 사용하겠다는 의미입니다.
//            
//            /*
//             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
//             */
//            
//            mailSender.send(mail);
//            System.out.println("메일 전송 성공!");
//            
//        } catch(Exception e) {
//            e.printStackTrace();
//            System.out.println("메일 전송 실패!");
//        }
//
//	}
	
	private static class TIME_MAXIMUM {
		public static final int SEC = 60;
		public static final int MIN = 60;
		public static final int HOUR = 24;
		public static final int DAY = 30;
		public static final int MONTH = 12;
	}
	
	public static String formatTimeString(String regTime, NotifyService notifyService) {
	
	// 비교시간 생성 쿼리
	int diffTime = notifyService.selectCompareTime(regTime);
	String msg = null;
	
	if (diffTime < TIME_MAXIMUM.SEC) {
		// sec
		msg = "방금 전";
	} else if ((diffTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN) {
		// min
		msg = diffTime + "분 전";
	} else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR) {
		// hour
		msg = (diffTime) + "시간 전";
	} else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY) {
		// day
		msg = (diffTime) + "일 전";
	} else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.MONTH) {
		// month
		msg = (diffTime) + "달 전";
	} else {
		// year
		msg = (diffTime) + "년 전";
	}
	return msg;
}
}




