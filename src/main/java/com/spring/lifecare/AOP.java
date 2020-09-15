package com.spring.lifecare;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Aspect
public class AOP {
   @Pointcut("execution(* com.spring.lifecare.service.User*.*(..))")
   public void sec_log() {};
	
	private static final Logger logger = LoggerFactory.getLogger(AOP.class);
	static String name = ""; 
	static String type = "";

	@Around("execution(* com.spring.lifecare.controller.*.*(..)) or execution(* com.spring.lifecare.service.*.*(..)) or execution(* com.spring.lifecare.persistence.*Impl.*(..))")
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable { 
		type = joinPoint.getSignature().getDeclaringTypeName(); 
		if (type.indexOf("Controller") > -1) { 
			name = "Controller \t: "; 
		} else if (type.indexOf("Service") > -1) { 
			name = "ServiceImpl \t: "; 
		} else if (type.indexOf("DAO") > -1) { 
			name = "DAO \t\t: "; 
		} 
		logger.info(name + type + "." + joinPoint.getSignature().getName() + "()"); 
		return joinPoint.proceed(); 
	}
	
	@Around("sec_log()")
    public Object logSecPrint(ProceedingJoinPoint joinPoint) throws Throwable { 
      type = joinPoint.getSignature().getDeclaringTypeName(); 
      
      logger.info(name + type + "." + joinPoint.getSignature().getName() + "()"); 
      return joinPoint.proceed(); 
   }
}
