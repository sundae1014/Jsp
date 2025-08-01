package service.user2;

import java.util.List;

import dao.user2.User2DAO;
import dto.user2.User2DTO;


public enum User2Service {
	
	INSTANCE;
	
	private User2DAO dao = User2DAO.getInstance();
	
	public void register(User2DTO dto) {
		dao.insertUser2(dto);
	}
	
	public User2DTO findById(String user_id) {
		return dao.selectUser2(user_id);
		
	}
	
	public List<User2DTO> findAll() {
		return dao.selectAllUser2();
		
	}
	
	public void modify(User2DTO dto) {
		dao.updateUser2(dto);
	}
	
	public void delete(String user_id) {
		dao.deleteUser2(user_id);
	}
	
}
