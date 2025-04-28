package com.beom.emp.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beom.controller.CommandHandler;
import com.beom.emp.model.EmpDao;

public class EmpDelAction implements CommandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		EmpDao empDao = new EmpDao();
		String msg = empDao.empDel(name) > 0 ? "사원삭제성공" : "사원삭제실패";
		req.setAttribute("msg", msg);
		return "/emp/empMsg.jsp";
	}
}
