package jboard.service;

import java.util.List;

import jboard.dao.UserDAO;
import jboard.dto.UserDTO;


public enum UserService {
	
	INSTANCE;
	
	private UserDAO dao = UserDAO.getInstance();
	
	public void register(UserDTO dto) {
		dao.insert(dto);
	}
	
	public UserDTO findById(String usid) {
		return dao.select(usid);
	}
	
	public List<UserDTO> findAll() {
		return dao.selectAll();
	}
	
	public void modify(UserDTO dto) {
		dao.update(dto);
	}
	
	public void remove(String usid) {
		dao.delete(usid);
	}
}
