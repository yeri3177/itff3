package com.kh.spring.proxy;

public class FooProxy implements Foo {

	private Foo foo;
	
	public FooProxy(Foo foo) {
		this.foo = foo;
	}
	
	@Override
	public String getName() {
		System.out.println("getName 호출전 부가기능");
		String name = foo.getName();
		System.out.println("getName 호출후 부가기능");
		return name;
	}

}
