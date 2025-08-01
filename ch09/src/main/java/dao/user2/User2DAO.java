package dao.user2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.user2.User2DTO;

public class User2DAO {
	
	private static final User2DAO INSTANCE = new User2DAO();
	
	public static User2DAO getInstance() {
		return INSTANCE;
	}
	
	private User2DAO() {}
	
	public void insertUser2(User2DTO dto) {
		try {
			Context ctx = (Context) new InitialContext().lookup("java:comp/env");
			DataSource ds = (DataSource) ctx.lookup("jdbc/sundae517");
			Connection conn = ds.getConnection();
			
			String sql = "INSERT INTO USER2 VALUES(?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUser_id());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getHp());
			psmt.setString(4, dto.getAge());
			
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public User2DTO selectUser2(String user_id) {
		
		User2DTO user2 = null;
		
		try {
			Context ctx = (Context) new InitialContext().lookup("java:comp/env");
			DataSource ds = (DataSource) ctx.lookup("jdbc/sundae517");
			Connection conn = ds.getConnection();
			
			String sql = "SELECT * FROM USER2 WHERE USER_ID=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				user2 = new User2DTO();
				user2.setUser_id(rs.getString(1));
				user2.setName(rs.getString(2));
				user2.setHp(rs.getString(3));
				user2.setAge(rs.getString(4));
				
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user2;
		
	}
	
	public List<User2DTO> selectAllUser2() {
		
		List<User2DTO> dtoList = new ArrayList<User2DTO>();
		
		try {
			Context ctx = (Context) new InitialContext().lookup("java:comp/env");
			DataSource ds = (DataSource) ctx.lookup("jdbc/sundae517");
			Connection conn = ds.getConnection();
			
			String sql = "SELECT * FROM USER2";
			PreparedStatement psmt = conn.prepareStatement(sql);

			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				User2DTO dto = new User2DTO();
				dto.setUser_id(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAge(rs.getString(4));
				
				dtoList.add(dto);
			}
			
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dtoList;
		
	}
	
	public void updateUser2(User2DTO dto) {
		try {
			Context ctx = (Context) new InitialContext().lookup("java:comp/env");
			DataSource ds = (DataSource) ctx.lookup("jdbc/sundae517");
			Connection conn = ds.getConnection();
			
			String sql = "UPDATE USER2 SET NAME=?, HP=?, AGE=? WHERE USER_ID=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getHp());
			psmt.setString(3, dto.getAge());
			psmt.setString(4, dto.getUser_id());
			
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteUser2(String user_id) {
		try {
			Context ctx = (Context) new InitialContext().lookup("java:comp/env");
			DataSource ds = (DataSource) ctx.lookup("jdbc/sundae517");
			Connection conn = ds.getConnection();
			
			String sql = "DELETE FROM USER2 WHERE USER_ID=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
