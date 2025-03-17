package com.yong.scope;

public class ScopeTest {
	private int count = 0;

	public ScopeTest() {
		System.out.println("ScopeTest 객체 생성됨.");
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count += count;
		System.out.println(count + "이 추가되어서 현재 값은 " + this.count + "입니다");
	}
}
