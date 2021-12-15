package com.kh.spring.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@Aspect
public class LoggingAspect {
	
	@Pointcut("execution(* com.kh.spring.memo..*(..))")
	public void pointcut() {}
	
	/**
	 * advice : 수행할 부가로직을 가지고 있는 메소드
	 * - Around advice : joinpoint 실행 전/후에(주 업무로직의 전후) 수행되는 advice
	 * 
	 * @param joinPoint
	 * @return
	 * @throws Throwable
	 */
	@Around("pointcut()")
	public Object logger(ProceedingJoinPoint joinPoint) throws Throwable {
		
		// 주 업무로직의 joinPoint 확인
		Signature signature = joinPoint.getSignature();
		String type = signature.getDeclaringTypeName();   // className
		String methodName = signature.getName();
		
		// before
		log.debug("[Around1] {}.{}", type, methodName);
		
		Object obj = joinPoint.proceed();   // 이게 목표 메소드
		
		// after
		log.debug("[Around2] {}.{}", type, methodName);
		
		
		return obj;
	}

}
