package com.yong.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}

	protected void userProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = resp.getWriter();

		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>이것은 서블릿</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>이것은 servlet입니다</h1>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();

	}

}
