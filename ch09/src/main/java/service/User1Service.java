package service;

import java.util.List;

import dao.user1.User1DAO;
import dto.User1DTO;

// Service : Controller의 부가적인 비즈니스 처리를 담당
public class User1Service {

	// 싱글톤
	private final static User1Service instance = new User1Service();
	public static User1Service getInstance() {
		return instance;
	}
	private User1Service() {}
	
	
	private User1DAO dao = User1DAO.getInstance();
	
	public void register(User1DTO dto) {
		dao.insertUser1(dto);
	}
	
	public User1DTO findById(String user_id) {		
		return dao.selectUser1(user_id);		
	}
	
	public List<User1DTO> findAll() {					
		return dao.selectAllUser1();
	}
	
	public void modify(User1DTO dto) {
		dao.updateUser1(dto);
	}
	
	public void delete(String user_id) {
		dao.deleteUser1(user_id);
	}
	
}
