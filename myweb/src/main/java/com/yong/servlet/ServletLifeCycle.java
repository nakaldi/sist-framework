package com.yong.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletLifeCycle extends HttpServlet{
	
	public ServletLifeCycle() {
		//필드를 초기화하기 위함
		System.out.println("-------1.생성자 호출됨--------");
	}
	
	
	@Override
	public void init() throws ServletException {
		//기능의 초기화를 위함
		super.init();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("-----------3.서비스 메서드 호출됨");
	}

	@Override
	public void destroy() {
		//소멸자로서 서버가 꺼질때 자동으로 호출되는 메서드.
		System.out.println("---------4.destroy 메서드 호출됨.");
	}
}
