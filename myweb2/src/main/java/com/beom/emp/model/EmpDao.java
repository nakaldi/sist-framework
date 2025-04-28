package com.beom.emp.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

	public int empDel(String name) {
		String sql = "DELETE FROM employee WHERE name = ?";
		try (Connection conn = BeomDB.getConn(); PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, name);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public List<EmpDto> empList() {
		String sql = "SELECT * FROM employee ORDER BY idx DESC";
		try (Connection conn = BeomDB.getConn();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			List<EmpDto> empDtos = new ArrayList<EmpDto>();
			while (rs.next()) {
				empDtos.add(new EmpDto(rs.getInt("idx"), rs.getString("name"), rs.getString("email"),
						rs.getString("dept")));
			}
			return empDtos;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<EmpDto> empSearch(String target) {
		String sql = "SELECT * FROM employee WHERE name LIKE ?";
		try (Connection conn = BeomDB.getConn(); PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, "%" + target + "%");
			ResultSet rs = pstmt.executeQuery();
			List<EmpDto> empDtos = new ArrayList<EmpDto>();
			while (rs.next()) {
				empDtos.add(new EmpDto(rs.getInt("idx"), rs.getString("name"), rs.getString("email"),
						rs.getString("dept")));
			}
			return empDtos;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public EmpDto empUpdateFind(int idx) {
		String sql = "SELECT * FROM employee WHERE idx = ? ";
		try (Connection conn = BeomDB.getConn(); PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setInt(1, idx);
			try (ResultSet rs = pstmt.executeQuery();) {
				if (rs.next())
					return new EmpDto(idx, rs.getString("name"), rs.getString("email"), rs.getString("dept"));
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int empUpdate(EmpDto empDto) {
		String sql = "UPDATE employee SET name = ?, email = ?, dept = ? WHERE idx = ?";
		try (Connection conn = BeomDB.getConn(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, empDto.getName());
			pstmt.setString(2, empDto.getEmail());
			pstmt.setString(3, empDto.getDept());
			pstmt.setInt(4, empDto.getIdx());
			int count = pstmt.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

}
