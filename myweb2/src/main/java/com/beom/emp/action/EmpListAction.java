package com.beom.emp.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beom.controller.CommandHandler;
import com.beom.emp.model.EmpDao;
import com.beom.emp.model.EmpDto;

public class EmpListAction implements CommandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmpDao empDao = new EmpDao();
		List<EmpDto> empDtos = empDao.empList();
		req.setAttribute("empDtos", empDtos);
		return "/emp/empList.jsp";
	}
}
