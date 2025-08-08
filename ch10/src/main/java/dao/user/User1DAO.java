package dao.user;

import java.util.ArrayList;
import java.util.List;

import dto.user.User1DTO;
import util.DBHelper;

public class User1DAO extends DBHelper{
	
	private static final User1DAO INSTANCE = new User1DAO();
	public static User1DAO getInstance() {
		return INSTANCE;
	}
	private User1DAO() {}
	
	private final String DBCP = "jdbc/studydb";
	
	public void insertUser1(User1DTO dto) {
		
		try {
			conn = getConnection(DBCP);
			
			String sql = "INSERT INTO USER1 VALUES(?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getHp());
			psmt.setInt(4, dto.getAge());
			
			psmt.executeUpdate();
			
			closeAll();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public User1DTO selectUser1(String uid) {
		User1DTO dto = null;
		try {
			conn = getConnection(DBCP);
			psmt = conn.prepareStatement("select * from user1 where uid=?");
			psmt.setString(1, uid);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto = new User1DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAge(rs.getString(4));
				
			}
			
			closeAll();			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public List<User1DTO> selectAllUser1() {
		
		List<User1DTO> dtoList = new ArrayList<User1DTO>();
		
		try {
			conn = getConnection(DBCP);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery("select * from user1");
			
			while(rs.next()) {
				User1DTO dto = new User1DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAge(rs.getInt(4));
				
				dtoList.add(dto);
			}
			
			closeAll();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dtoList;
	}
	public void updateUser1(User1DTO dto) {
		try {
			conn = getConnection(DBCP);
			String sql = "update user1 set name=?, hp=?, age=? where uid=?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getHp());
			psmt.setInt(3, dto.getAge());
			psmt.setString(4, dto.getUid());
			psmt.executeUpdate();
			
			closeAll();			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteUser1(String uid) {
		try {
			conn = getConnection(DBCP);
			String sql = "delete from user1 where uid=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, uid);
			psmt.executeUpdate();
			
			closeAll();			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
