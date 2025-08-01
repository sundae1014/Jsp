package service.user3;

import java.util.List;

import dao.user3.User3DAO;
import dto.user3.User3DTO;

public enum User3Service {
	
	INSTANCE;
	
	private User3DAO dao = User3DAO.getInstance();
	
	public void register(User3DTO dto) {
		dao.insertUser3(dto);
	}
	
	public User3DTO findById(String user_id) {
		return dao.selectUser3(user_id);
	}
	
	public List<User3DTO> findAll() {
		return dao.selectAllUser3();
	}
	
	public void modify(User3DTO dto) {
		dao.updateUser3(dto);
	}
	
	public void delete(String user_id) {
		dao.deleteUser3(user_id);
	}
}
