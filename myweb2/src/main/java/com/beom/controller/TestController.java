package com.beom.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestController extends HttpServlet {
	private Map<String, CommandHandler> map;
	private static final long serialVersionUID = 1L;

	public TestController() {
		map = new HashMap<String, CommandHandler>();
	}

	@Override
	public void init() throws ServletException {
		String filePath = this.getServletContext().getRealPath("/WEB-INF/beomCommand.properties");
		Properties properties = new Properties();
		try (FileInputStream fileInputStream = new FileInputStream(filePath);) {
			properties.load(fileInputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 선생님 코드. 프로퍼티 가져와서 map에 넣기.
//		Iterator keys = properties.keySet().iterator();
//		while (keys.hasNext()) {
//			String key = (String) keys.next();
//			String value = properties.getProperty(key);
//
//			try {
//				Class originClass = Class.forName(value);
//				CommandHandler temp = (CommandHandler) originClass.newInstance();
//				map.put(key, temp);
//			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
//				e.printStackTrace();
//			}
//		}

		map = properties.entrySet().stream().collect(Collectors.toMap(e -> (String) e.getKey(), e -> {
			CommandHandler commandHandler = null;
			try {
				commandHandler = (CommandHandler) (Class.forName((String) e.getValue()).getDeclaredConstructor()
						.newInstance());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			return commandHandler;
		}));
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doUserProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doUserProcess(req, resp);
	}

	protected void doUserProcess(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		// 실질 코드
		// 1. 요청 받기
//		String type = req.getParameter("type");
		// URI 패턴으로 변경해보겠음
		String uriCommand = req.getRequestURI();
		if (uriCommand.indexOf(req.getContextPath()) == 0) {
			uriCommand = uriCommand.substring(req.getContextPath().length());
		}

		// 2. 요청 분석
		CommandHandler commandHandler = map.get(uriCommand);
		String path = commandHandler.process(req, resp);

		// 5. 전가하기(request에 저장했기 때문에 리다이렉트가 아닌 포워드로 전달해야함. )
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
}
