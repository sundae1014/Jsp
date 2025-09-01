package jboard.dao;

import java.util.List;

import jboard.dto.FileDTO;

public class FileDAO {
	
	private final static FileDAO INSTANCE = new FileDAO();
	public static FileDAO getInstance() {
		return INSTANCE;
	}
	private FileDAO() {}
	
	public void insert(FileDTO dto) {
		
	}
	
	public FileDTO select(int fno) {
		return null;
	}
	
	public List<FileDTO> selectAll() {
		return null;
	}
	
	public void update(FileDTO dto) {
		
	}
	
	public void delete(int fno) {
		
	}
}
