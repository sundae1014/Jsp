package dao;

import java.util.ArrayList;
import java.util.List;

import dto.LectureDTO;
import util.DBHelper;

public class LectureDAO extends DBHelper {
	
	private static final LectureDAO INSTANCE = new LectureDAO();
	public static LectureDAO getInstance() {
		return INSTANCE;
	}
	private LectureDAO() {}
	
	private final String DBCP = "jdbc/collegeERD";
	
	// 기본 CRUD
	public LectureDTO select(int lecNo) {
		return null;
	}
	
	public List<LectureDTO> selectAll() {
		
		List<LectureDTO> dtoList = new ArrayList<LectureDTO>();
		
		try {
			conn = getConnection(DBCP);
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM LECTURE");
			
			while(rs.next()) {
				LectureDTO dto = new LectureDTO();
				dto.setLecNo(rs.getInt(1));
				dto.setLecName(rs.getString(2));
				dto.setLecCredit(rs.getInt(3));
				dto.setLecTime(rs.getInt(4));
				dto.setLecClass(rs.getString(5));				
				dtoList.add(dto);
			}			
			closeAll();			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dtoList;
	}
	
	public void insert(LectureDTO dto) {
		try {
			conn = getConnection(DBCP);
			psmt = conn.prepareStatement("insert into lecture values (?,?,?,?,?)");
			psmt.setInt(1, dto.getLecNo());
			psmt.setString(2, dto.getLecName());
			psmt.setInt(3, dto.getLecCredit());
			psmt.setInt(4, dto.getLecTime());
			psmt.setString(5, dto.getLecClass());
			psmt.executeUpdate();
			
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void update(LectureDTO dto) {}
	public void delete(int lecNo) {}
}





