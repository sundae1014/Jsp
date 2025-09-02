package jboard.dao;

import java.util.List;

import jboard.dto.UserDTO;
import jboard.util.DBHelper;
import jboard.util.Sql;

public class UserDAO extends DBHelper{
	
	private final static UserDAO INSTANCE = new UserDAO();
	public static UserDAO getInstance() {
		return INSTANCE;
	}
	private UserDAO() {}
	
	public void insert(UserDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_USER);
			psmt.setString(1, dto.getUsid());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getUs_name());
			psmt.setString(4, dto.getNick());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getHp());
			psmt.setString(7, dto.getZip());
			psmt.setString(8, dto.getAddr1());
			psmt.setString(9, dto.getAddr2());
			psmt.setString(10, dto.getReg_ip());
			
			psmt.executeUpdate();
			
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int selectCount(String col, String value) {
		
		int count = 0;
		
		try {
			conn = getConnection();
			
			StringBuilder sql = new StringBuilder(Sql.SELECT_COUNT);
			
			if(col.equals("uid")) {
				sql.append(Sql.WHERE_USID);
			}else if(col.equals("nick")) {
				sql.append(Sql.WHERE_NICK);
			}else if(col.equals("email")) {
				sql.append(Sql.WHERE_EMAIL);
			}else if(col.equals("hp")) {
				sql.append(Sql.WHERE_HP);
			}
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, value);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
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
