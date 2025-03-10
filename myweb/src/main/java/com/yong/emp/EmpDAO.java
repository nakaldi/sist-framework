package com.yong.emp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.yong.db.YongDB;

public class EmpDAO {
	private Connection conn;
	private ResultSet rs;
	PreparedStatement ps;
	private static final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String user = "scott";
	private static final String pwd = "1234";

	public EmpDAO() {
		System.out.println("EmpDAO객체 생성됨!");
	}

	public int empAdd(EmpDTO dto) {
		String sql = "insert into employee values(employee_idx.nextval,?,?,?)";

		try {
			conn = YongDB.getConn();
			ps = conn.prepareStatement(sql);

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getDept());
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			return -1;
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
