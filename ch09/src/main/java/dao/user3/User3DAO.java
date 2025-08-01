package dao.user3;

import java.util.List;

import dto.user3.User3DTO;

public class User3DAO {
	
	private static final User3DAO INSTANCE = new User3DAO();
	
	public static User3DAO getInstance() {
		return INSTANCE;
	}
	
	private User3DAO() {}
	
	public void insertUser3(User3DTO dto) {
		
	}
	
	public User3DTO selectUser3(String user_id) {
		return null;
	}
	
	public List<User3DTO> selectAllUser3() {
		return null;
	}
	
	public void updateUser3(User3DTO dto) {
		
	}
	
	public void deleteUser3(String user_id) {
		
	}
	
}
