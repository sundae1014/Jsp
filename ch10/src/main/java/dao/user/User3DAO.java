package dao.user;

import java.util.ArrayList;
import java.util.List;

import dto.user.User3DTO;
import util.DBHelper;

public class User3DAO extends DBHelper{
	
	private static final User3DAO INSTANCE = new User3DAO();
	public static User3DAO getInstance() {
		return INSTANCE;
	}
	private User3DAO() {}
	
	private final String DBCP = "jdbc/studydb";
	
	public void insertUser3(User3DTO dto) {
		
		try {
			conn = getConnection(DBCP);
			psmt = conn.prepareStatement("INSERT INTO USER3 VALUES (?,?,?,?,?)");
			
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getBirth());
			psmt.setString(4, dto.getHp());
			psmt.setString(5, dto.getAddr());
			psmt.executeUpdate();
			
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public User3DTO selectUser3(String uid) {
		User3DTO dto = null;
		try {
			conn = getConnection(DBCP);
			psmt = conn.prepareStatement("select * from user3 where uid=?");
			psmt.setString(1, uid);

			rs = psmt.executeQuery();
			while(rs.next()) {
				dto = new User3DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setBirth(rs.getString(3));
				dto.setHp(rs.getString(4));
				dto.setAddr(rs.getString(5));
			}
			
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public List<User3DTO> selectAllUser3() {
		List<User3DTO> dtoList = new ArrayList<User3DTO>();
		try {
			conn = getConnection(DBCP);
			psmt = conn.prepareStatement("select * from user3");

			rs = psmt.executeQuery();
			while(rs.next()) {
				User3DTO dto = new User3DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setBirth(rs.getString(3));
				dto.setHp(rs.getString(4));
				dto.setAddr(rs.getString(5));
				
				dtoList.add(dto);
			}
			
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dtoList;
	}
	
	public void updateUser3(User3DTO dto) {
		try {
			conn = getConnection(DBCP);
			psmt = conn.prepareStatement("update user3 set name=?, birth=?, hp=?, addr=? where uid=?");
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getBirth());
			psmt.setString(3, dto.getHp());
			psmt.setString(4, dto.getAddr());
			psmt.setString(5, dto.getUid());
			psmt.executeUpdate();
			
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public void deleteUser3(String uid) {
		try {
			conn = getConnection(DBCP);
			psmt = conn.prepareStatement("delete from user3 where uid=?");
			psmt.setString(1, uid);			

			psmt.executeUpdate();
			
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}

