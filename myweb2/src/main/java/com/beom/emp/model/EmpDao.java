package com.beom.emp.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.beom.db.BeomDB;

public class EmpDao {
	public EmpDao() {
	}

	public int empAdd(EmpDto empDto) {
		String sql = "INSERT INTO employee VALUES(employee_idx.NEXTVAL, ?, ?, ?)";
		try (Connection conn = BeomDB.getConn(); PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, empDto.getName());
			pstmt.setString(2, empDto.getEmail());
			pstmt.setString(3, empDto.getDept());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
