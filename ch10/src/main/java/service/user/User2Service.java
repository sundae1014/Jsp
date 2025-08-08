package service.user;

import java.util.List;

import dao.user.User2DAO;
import dto.user.User2DTO;

public enum User2Service {
	
	INSTANCE;
	
	private User2DAO dao = User2DAO.getInstance();
	
	public void register(User2DTO dto) {
		dao.insertUser2(dto);
	}
	
	public User2DTO findById(String uid) {
		return dao.selectUser2(uid);
	}
	
	public List<User2DTO> findAll() {
		return dao.selectAllUser2();
	}
	
	public void modify(User2DTO dto) {
		dao.updateUser2(dto);
	}
	
	public void delete(String uid) {
		dao.deleteUser2(uid);
	}
	
}
