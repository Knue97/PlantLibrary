package kr.co.plantlibrary.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LoggerAspect {
	
	protected Logger logger = LoggerFactory.getLogger(LoggerAspect.class);
	
	@Around("execution(* kr.co.plantlibrary.controller.BoardController.*(..))")
	public Object logPrint(ProceedingJoinPoint joinpoint) throws Throwable {
//		핵심 업무 실행 전
		Object result = null;
		long start = System.currentTimeMillis();
		
//		핵심 업무 (= (*Controller.*를 잡아놓은 상태) 실행시키는 것 ) 실행
		result = joinpoint.proceed();

		//		핵심 업무 실행 끝
		long end = System.currentTimeMillis();
		
		logger.info("-> 수행시간" + (end-start) + "밀리초");
		
		return result;
	}
	
}
