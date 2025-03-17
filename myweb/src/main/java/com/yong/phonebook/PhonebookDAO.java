package com.yong.phonebook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yong.db.YongDB;

public class PhonebookDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public PhonebookDAO() {
	}

	public int phoneAdd(PhonebookDTO dto) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "scott";
			String pwd = "1234";
			String sql = "insert into phonebook values(phonebook_idx.nextval, ?,?,?)";
			conn = DriverManager.getConnection(url, user, pwd);
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getTel());
			ps.setString(3, dto.getAddr());
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

	public ArrayList<PhonebookDTO> phoneListPart2() {
		ArrayList<PhonebookDTO> phonebooks = new ArrayList<PhonebookDTO>();
		String sql = "select * from phonebook order by idx desc";
		try (Connection conn = YongDB.getConn();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();) {
			while (rs.next()) {
				phonebooks.add(new PhonebookDTO(rs.getInt("idx"), rs.getString("name"), rs.getString("tel"),
						rs.getString("addr")));
			}
			return phonebooks;

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return null;
	}
}
