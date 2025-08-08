package service.user;

import java.util.List;

import dao.user.User1DAO;
import dto.user.User1DTO;

public enum User1Service {

	INSTANCE;
	
	private User1DAO dao = User1DAO.getInstance();
	
	public void register(User1DTO dto) {
		dao.insertUser1(dto);
	}
	
	public User1DTO findById(String uid) {
		return dao.selectUser1(uid);
	}
	
	public List<User1DTO> findAll() {
		return dao.selectAllUser1();
	}
	
	public void modify(User1DTO dto) {
		dao.updateUser1(dto);
	}
	
	public void delete(String uid) {
		dao.deleteUser1(uid);
	}
	
}
