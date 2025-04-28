package com.beom.emp.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beom.controller.CommandHandler;
import com.beom.emp.model.EmpDao;
import com.beom.emp.model.EmpDto;

public class EmpAddAction implements CommandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		EmpDto empDto = new EmpDto(0, req.getParameter("name"), req.getParameter("email"), req.getParameter("dept"));
		EmpDao empDao = new EmpDao();
		return empDao.empAdd(empDto) > 0 ? "사원등록성공" : "사원등록실패";
	}

}
