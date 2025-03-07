package com.yong.servlet;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestCountServlet extends HttpServlet {
	private int count;
	private String fileName;

	public GuestCountServlet() {
		// 값의 초기화
		count = 0;
		fileName = "c:/student_java/count.txt";
	}
	@Override
	public void init() throws ServletException {
		// 행위 초기화
		try {
			BufferedReader br = new BufferedReader(new FileReader(fileName));
			count = Integer.parseInt(br.readLine());
			br.close();
		} catch (NumberFormatException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		userProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		userProcess(req, resp);
	}

	protected void userProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();

		pw.println("<html><head><title>손님 접속 카운트</title></head>");
		pw.println("<body>");
		
		count++;
		pw.println("<h1>히히 낄낄 헤헤 깔깔 낄" + count + "</h1>");

		pw.println("</body>");
		pw.println("</html>");

		pw.close();
	}
	
	@Override
	public void destroy() {
		try {
			PrintWriter pw = new PrintWriter(new FileWriter(fileName));
			pw.println(count);
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
