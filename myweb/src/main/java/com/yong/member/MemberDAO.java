package com.yong.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.yong.config.DBHelper;

public class MemberDAO {

	public MemberDAO() {
	}

	public int memberJoin(MemberDTO memberDTO) {
		String sql = "INSERT INTO jsp_member (idx, id, pwd, name, email, tel, addr) "
				+ "VALUES(jsp_member_idx.NEXTVAL,?,?,?,?,?,?)";
		try (Connection conn = DBHelper.connect(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setString(1, memberDTO.getId());
			ps.setString(2, memberDTO.getPwd());
			ps.setString(3, memberDTO.getName());
			ps.setString(4, memberDTO.getEmail());
			ps.setString(5, memberDTO.getTel());
			ps.setString(6, memberDTO.getAddr());
			int count = ps.executeUpdate();
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}

	/**
	 * @return 개똥같은 메서드명 덕분에 쓴다. DB에 아이디가 존재하면 true, 없으면 false 반환
	 */
	public boolean idCheck(String id) {
		String sql = "SELECT * FROM jsp_member WHERE id = ?";
		try (Connection conn = DBHelper.connect(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setString(1, id);
			try (ResultSet rs = ps.executeQuery();) {
				if (!rs.isBeforeFirst()) {
					return false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}

}
