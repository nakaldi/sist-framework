package com.yong.filebbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yong.db.YongDB;

public class FileBbsDAO {

	public int fileBbsUpload(String filename, String writer) {
		String sql = "insert into jsp_filebbs values(jsp_filebbs_idx.nextval, ?, ?)";
		try (Connection conn = YongDB.getConn(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, filename);
			ps.setString(2, writer);
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<FileBbsDTO> fileBbsList() {
		String sql = "select * from jsp_filebbs order by idx desc";

		try (Connection conn = YongDB.getConn();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			ArrayList<FileBbsDTO> list = new ArrayList<FileBbsDTO>();
			while (rs.next()) {
				list.add(new FileBbsDTO(rs.getInt("idx"), rs.getString("filename"), rs.getString("writer")));
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
