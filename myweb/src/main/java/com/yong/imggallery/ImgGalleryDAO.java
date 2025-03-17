package com.yong.imggallery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yong.db.YongDB;

public class ImgGalleryDAO {

	public List<ImgGalleryDTO> findAllImgGallery() {
		String sql = "SELECT * FROM jsp_imggallery";
		try (Connection conn = YongDB.getConn();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();) {
			List<ImgGalleryDTO> list = new ArrayList<ImgGalleryDTO>();
			while (rs.next()) {
				list.add(new ImgGalleryDTO(rs.getInt("idx"), rs.getString("writer"), rs.getString("originname"),
						rs.getString("systemname")));
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int addImgGallery(String writer, String originName, String systemName) {
		String sql = "INSERT INTO jsp_imggallery VALUES(jsp_imggallery_idx.NEXTVAL, ?, ?, ?)";
		try (Connection conn = YongDB.getConn(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setString(1, writer);
			ps.setString(2, originName);
			ps.setString(3, systemName);
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
}
