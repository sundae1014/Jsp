package service.college;

import java.util.List;

import dao.college.StudentDAO;
import dto.college.StudentDTO;

public enum StudentService {
	
	INSTANCE;
	
	private StudentDAO dao = StudentDAO.getInstance();
	
	public void insertStudent(StudentDTO dto) {
		dao.insertStudent(dto);
	}
	
	public StudentDTO selectStudent(String stdno) {
		dao.selectStudent(stdno);
		return null;
	}
	
	public List<StudentDTO> selectAllStudent() {
		dao.selectAllStudent();
		return null;
	}
	
	public void updateStudent(StudentDTO dto) {
		dao.updateStudent(dto);
	}
	
	public void deleteStudent(String stdno) {
		dao.deleteStudent(stdno);
	}
	
}
