package com.beom.emp.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beom.controller.CommandHandler;

public class EmpAction implements CommandHandler{
	/**
	 * emp 폴더에 있는 emp.jsp로 이동시키는 메서드
	 * */
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		return "/emp/emp.jsp";
	}
}
