package com.yong.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.yong.db.YongDB;

public class BbsDAO {
	public List<BbsDTO> findAllPosts() {
		String sql = "SELECT * FROM posts";
		try (Connection conn = YongDB.getConn();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();) {
			List<BbsDTO> list = new ArrayList<BbsDTO>();
			while (rs.next()) {
				list.add(new BbsDTO(rs.getInt("id"), rs.getString("title"), rs.getString("content"),
						rs.getString("author"), rs.getString("pwd"), rs.getTimestamp("created_at").toLocalDateTime(),
						rs.getInt("parent_id"), rs.getInt("depth"), rs.getInt("order_num"), rs.getInt("view_count")));
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int addPost(BbsDTO bbsDTO) {
		String sql = "INSERT INTO posts VALUES(jsp_imggallery_idx.NEXTVAL,?,?,?,?,SYSDATE,?,?,?,?)";
		try (Connection conn = YongDB.getConn(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setString(1, bbsDTO.getTitle());
			ps.setString(2, bbsDTO.getContent());
			ps.setString(3, bbsDTO.getAuthor());
			ps.setString(4, bbsDTO.getPwd());
			ps.setInt(5, bbsDTO.getParentId());
			ps.setInt(6, bbsDTO.getDepth());
			ps.setInt(7, bbsDTO.getOrderNum());
			ps.setInt(8, bbsDTO.getViewCount());
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
}
