package com.kh.spring.common.aop;

import java.security.InvalidParameterException;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.spring.memo.model.service.MemoService;
import com.kh.spring.memo.model.vo.Memo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@Aspect
public class MemoAspect {
	
	@Autowired
	private MemoService memoService;

	@Pointcut("execution(* com.kh.spring.memo.model.service..deleteMemo(..))")   // service 패키지 하위의 deleteMemo 메소드를 호출할 때
	public void deletePointcut() {}
	
	@Before("deletePointcut()")
	public void passwordCheck(JoinPoint joinPoint) {
		//타겟메소드 실행전 코드
		
		// 매개인자(arguments) 가져오기
		Object[] args = joinPoint.getArgs();    // MemoServiceImple에 있는 deleteMemo 메소드의 매개인자(글번호와 입력한 비번)
		int no = (int) args[0];  
		String password = (String) args[1];
		log.debug("no = {}, password = {}", no, password);
		
		// no 레코드 가져오기
		Memo memo = memoService.selectOneMemo(no);
		if(memo != null && !password.equals(memo.getPassword())) {
			throw new InvalidParameterException("비밀번호가 일치하지 않습니다.");
			
		}
		
	}
	
}
