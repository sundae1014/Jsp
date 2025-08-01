package dao.college;

import java.util.List;

import dto.college.StudentDTO;
import util.DBHelper;

public class StudentDAO extends DBHelper{
	
	private static final StudentDAO INSTANCE = new StudentDAO();
	
	public static StudentDAO getInstance() {
		return INSTANCE;
	}
	
	private StudentDAO() {}
	
	private final String BDCP = "jdbc/college";
	
	public void insertStudent(StudentDTO dto) {
		try {
			conn = getConnection(BDCP);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public StudentDTO selectStudent(String stdno) {
		try {
			conn = getConnection(BDCP);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<StudentDTO> selectAllStudent() {
		try {
			conn = getConnection(BDCP);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void updateStudent(StudentDTO dto) {
		
	}
	
	public void deleteStudent(String stdno) {
		
	}
	
	
	
}
