package com.beom.emp.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beom.controller.CommandHandler;
import com.beom.emp.model.EmpDao;
import com.beom.emp.model.EmpDto;

public class EmpUpdateFindAction implements CommandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String idxParam = req.getParameter("idx");
		if (idxParam==null||"".equals(idxParam)) {
			idxParam="0";
		}
		int idx=Integer.parseInt(idxParam);
		EmpDao empDao = new EmpDao();
		EmpDto empDto = empDao.empUpdateFind(idx);
		
		String path = "/emp/empMsg.jsp";
		if (empDto==null) {
			req.setAttribute("msg", "잘못된 접근 또는 퇴사한 사원입니다.");
		}else {
			req.setAttribute("empDto", empDto);
			path = "/emp/empUpdate.jsp";
		}
		
		return path;
	}

}
