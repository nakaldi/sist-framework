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
	/**
	 * @return posts 테이블에서 id로 내림차순 정렬된 행들을 offset개 뒤부터 limit 개 뽑아서 리스트로 반환
	 */
	public List<BbsDTO> findPostsWithOffsetAndLimit(int offset, int limit) {
//		String sql = "SELECT * FROM posts ORDER BY id DESC OFFSET " + offset + " FETCH FIRST " + limit + " ROWS ONLY";
		String sql = "select * from ( " 
		           + "select rownum as rn, a.* from ( " 
		           + "select * from posts " 
		           + "order by parent_id desc, depth asc, order_num asc " 
		           + ") a " 
		           + ") where " + offset + " <= rn AND rn < " + (offset + limit) + " ";
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
			ps.setInt(5, bbsDTO.getRef());
			ps.setInt(6, bbsDTO.getDepth());
			ps.setInt(7, bbsDTO.getOrderNum());
			ps.setInt(8, bbsDTO.getViewCount());
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public BbsDTO findPostById(int id) {
		String sql = "SELECT * FROM posts where id=?";
		try (Connection conn = YongDB.getConn(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setInt(1, id);
			try (ResultSet rs = ps.executeQuery();) {
				BbsDTO post = null;
				if (rs.next()) {
					post = new BbsDTO(rs.getInt("id"), rs.getString("title"), rs.getString("content"),
							rs.getString("author"), rs.getString("pwd"),
							rs.getTimestamp("created_at").toLocalDateTime(), rs.getInt("parent_id"), rs.getInt("depth"),
							rs.getInt("order_num"), rs.getInt("view_count"));
				}
				return post;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int getCountFromPosts() {
		String sql = "SELECT COUNT(*) FROM posts";
		try (Connection conn = YongDB.getConn();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery(sql);) {
			rs.next();
			return rs.getInt(1);
		} catch (Exception e) {
		}
		return -1;
	}

	public int getMaxRef() {
		String sql = "SELECT MAX(parent_id) FROM posts";
		try (Connection conn = YongDB.getConn();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();) {
			int ref = 0;
			if (rs.next()) {
				ref = rs.getInt(1);
			}
			return ref;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int getMaxOrderNumFromRefAndDepth(int ref, int depth) {
		String sql = "SELECT MAX(order_num) FROM posts WHERE parent_id = ? AND depth = ?";
		try (Connection conn = YongDB.getConn(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setInt(1, ref);
			ps.setInt(2, depth);
			try (ResultSet rs = ps.executeQuery();) {
				if (rs.next()) {
					// WHERE 조건에 맞는 결과가 없어도 MAX는 null값을 가져오고, 그 null값이 들어있는 rs.getInt는 0을 반환함.
					int orderNum = rs.getInt(1);
					// 그렇기 때문에 실제 값 0인지 null값인지 알 수 가 없어서, getInt 이후에 wasNull로 null이었는지 검사해줌. 이 경우에는
					// null이든 0이든 처리 방식이 같기 때문에 상관 없음. 하지만 명시적으로 작성해주었음.
					orderNum = rs.wasNull() ? 0 : orderNum;
					return orderNum;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

}
