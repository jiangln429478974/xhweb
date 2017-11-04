package com.cssnb.util;

import  org.aspectj.lang.ProceedingJoinPoint;      
import  org.aspectj.lang.annotation.After;      
import  org.aspectj.lang.annotation.AfterReturning;      
import  org.aspectj.lang.annotation.AfterThrowing;      
import  org.aspectj.lang.annotation.Around;      
import  org.aspectj.lang.annotation.Aspect;      
import  org.aspectj.lang.annotation.Before;      
import  org.aspectj.lang.annotation.Pointcut;      

@Aspect
public class AspectS {


    // execution最常用,可以通过 & || !进行切入点表达式的连接       
    // 可是是表达式，可以通过切入点标识重用表达式       
	@Pointcut("execution (* com.cssnb.ftp.service.*.*(..))")//定义一个切点 
    public   void  helloworld() { 
//    	 System.out.println("before sayHello" );    
    }      
     
//    @Before ( "execution(public void test.HelloWorld.sayHello(String))" )      
//    public   void  beforeSayHello() {      
//        System.out.println("before sayHello" );      
//    }      
     
    @After ( "helloworld()" )      
    public   void  afterSayHello() {      
        System.out.println("after sayHello" );      
    }      
     
//    @AfterThrowing ( "test.AspectS.helloworld()" )      
//    public   void  exceptionSayHello() {      
//        System.out.println("throw runtime exception" );      
//    }      
     
//    @AfterReturning ( "test.AspectS.helloworld()" )      
//    public   void  returnSayHello() {      
//        System.out.println("method has returned" );      
//    }      
     
    @Around ( "execution(* com.cssnb.util.AspectS.helloworld())" )      
    public  Object aroundSayHello(ProceedingJoinPoint pjp) {      
        Object obj = null ;      
        try  {      
            System.out.println("around start" );      
            obj = pjp.proceed();      
            System.out.println("around end" );      
        } catch  (Throwable e) {      
            e.printStackTrace();      
        }      
        return  obj;      
    }      
}
