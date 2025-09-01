package jboard.dao;

import java.util.List;

import jboard.dto.CommentDTO;


public class CommentDAO {
	
	private final static CommentDAO INSTANCE = new CommentDAO();
	public static CommentDAO getInstance() {
		return INSTANCE;
	}
	private CommentDAO() {}
	
	public void insert(CommentDTO dto) {
		
	}
	
	public CommentDTO select(int cno) {
		return null;
	}
	
	public List<CommentDTO> selectAll() {
		return null;
	}
	
	public void update(CommentDTO dto) {
		
	}
	
	public void delete(int cno) {
		
	}
}
