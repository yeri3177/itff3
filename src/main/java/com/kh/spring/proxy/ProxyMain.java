package com.kh.spring.proxy;

public class ProxyMain {

	public static void main(String[] args) {
		Foo foo1 = new FooProxy(new FooImpl());
		String name = foo1.getName();
		System.out.println(name);
		
		/**
		 * FooImpl : 개발한 클래스
		 * FooProxy
		 */
		Foo foo2 = new FooProxy(new FooImpl());
		name = foo2.getName();
		System.out.println(name);
	}

}
