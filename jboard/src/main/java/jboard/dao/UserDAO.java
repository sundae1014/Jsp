package jboard.dao;

import java.util.List;

import jboard.dto.UserDTO;

public class UserDAO {
	
	private final static UserDAO INSTANCE = new UserDAO();
	public static UserDAO getInstance() {
		return INSTANCE;
	}
	private UserDAO() {}
	
	public void insert(UserDTO dto) {
		
	}
	
	public UserDTO select(String usid) {
		return null;
	}
	
	public List<UserDTO> selectAll() {
		return null;
	}
	
	public void update(UserDTO dto) {
		
	}
	
	public void delete(String usid) {
		
	}
}
