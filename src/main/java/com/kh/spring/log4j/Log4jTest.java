package com.kh.spring.log4j;

import org.apache.log4j.Logger;

//@Log4j
public class Log4jTest {

	private static final Logger log = Logger.getLogger(Log4jTest.class);

	/**
	 * logging level
	 * 
	 * 1. fatal : 심각한 에러
	 * 2. error : 요청처리중 에러
	 * 3. warn  : 당장 프로그램 실행에는 문제가 없지만, 잠재적 오류가능성 있음
	 * 4. info  : 정보성 메시지
	 * 5. debug : 개발시 로깅(운영시에는 필요없음)
	 * 6. trace : 디버그시에 세밀한 단위 지정
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		log.fatal("fatal");
		log.error("error");
		log.warn("warn");
		log.info("info");
		log.debug("debug");
		log.trace("trace");
		
		
	}

}
