package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.TransactionDTO;
import util.DBHelper;
import util.Sql;

public class TransactionDAO extends DBHelper {
	private static final TransactionDAO INSTANCE = new TransactionDAO();
	public static TransactionDAO getInstance() {
		return INSTANCE;
	}
	private TransactionDAO() {}
	
	
	public void insertAndUpdate(TransactionDTO dto) {
		try {
			conn = getConnection();
			
			conn.setAutoCommit(false); // 자동커밋 해제(트랜잭션 시작)
			
			psmt = conn.prepareStatement(Sql.INSERT_TRANSACTION);
			psmt.setString(1, dto.getT_a_no());
			psmt.setInt(2, dto.getT__dist());
			psmt.setInt(3, dto.getT_amount());			
			psmt.executeUpdate();
			
			psmt1 = conn.prepareStatement(Sql.UPDATE_ACCOUNT_PLUS); // 상대방 계좌
			psmt1.setInt(1, dto.getT_amount());
			psmt1.setString(2, dto.getT_a_no_to());
			psmt1.executeUpdate();
			
			psmt2 = conn.prepareStatement(Sql.UPDATE_ACCOUNT_MINUS); // 내 계좌
			psmt2.setInt(1, dto.getT_amount());
			psmt2.setString(2, dto.getT_a_no());
			psmt2.executeUpdate();
			
			conn.commit(); // 작업확정
						
			closeAll();			
			
		}catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}		
		
	}
	
	
	
	
	public TransactionDTO select(int t_no) {
		return null;
	}
	public List<TransactionDTO> selectAll() {
		List<TransactionDTO> dtoList = new ArrayList<TransactionDTO>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ALL_TRANSACTION);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				TransactionDTO dto = new TransactionDTO();
				dto.setT_no(rs.getInt(1));
				dto.setT_a_no(rs.getString(2));
				dto.setT__dist(rs.getString(3));
				dto.setT_amount(rs.getString(4));
				dto.setT_datetime(rs.getString(5));
				
				dtoList.add(dto);
			}
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dtoList;
	}
	public void update(TransactionDTO dto) {}
	public void delete(int t_no) {}
}