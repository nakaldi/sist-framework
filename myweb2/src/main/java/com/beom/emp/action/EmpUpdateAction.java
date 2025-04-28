package com.beom.emp.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beom.controller.CommandHandler;
import com.beom.emp.model.EmpDao;
import com.beom.emp.model.EmpDto;

public class EmpUpdateAction implements CommandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String dept = req.getParameter("dept");
		
		EmpDto empDto = new EmpDto(idx, name, email, dept);
		EmpDao empDao = new EmpDao();
		int result = empDao.empUpdate(empDto);
		String msg = result > 0 ? "사원 정보수정 성공" : "사원 정보수정 실패";
		req.setAttribute("msg", msg);
		return "/emp/empMsg.jsp";
	}

}
