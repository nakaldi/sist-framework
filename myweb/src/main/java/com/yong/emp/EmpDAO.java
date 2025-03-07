package com.yong.emp;

import java.sql.*;
import java.util.*;

public class EmpDAO {
	private ResultSet rs;
	private static final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String user = "scott";
	private static final String pwd = "1234";

	public EmpDAO() {
		System.out.println("EmpDAO객체 생성됨!");
	}

	public int empAdd(EmpDTO dto) {
		String sql = "insert into employee values(employee_idx.nextval,?,?,?)";
		try (Connection conn = DriverManager.getConnection(url, user, pwd);
				PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getDept());
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			return -1;
		}
	}
}
