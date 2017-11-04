package test;

public class HelloWorld {
	 public void sayHello(String helloworld) {
	  System.out.println(helloworld);
	  throw new RuntimeException();
	                //这个异常是拿来测试，可有可无
	 }
}
