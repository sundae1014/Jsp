package dao.shop;


import java.util.ArrayList;
import java.util.List;

import dto.shop.CustomerDTO;
import util.DBHelper;

public class CustomerDAO extends DBHelper {
	
	private static final CustomerDAO instance = new CustomerDAO();
	
	public static CustomerDAO getInstance() {
		return instance;
	}
	
	private CustomerDAO() {}
	
	private final String DBCP = "jdbc/shop";
	
	public void insertCustomer(CustomerDTO dto) {
		try {
			conn = getConnection(DBCP);
			
			String sql = "INSERT INTO CUSTOMER VALUES (?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getCid());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getHp());
			psmt.setString(4, dto.getAddress());
			psmt.setString(5, dto.getRdate());
			
			psmt.executeUpdate();
			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public CustomerDTO selectCustomer(String cid) {
		
		CustomerDTO dto = null;
		
		try {
			conn = getConnection(DBCP);
			
			String sql = "SELECT * FROM CUSTOMER WHERE CID = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cid);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto = new CustomerDTO();
				dto.setCid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAddress(rs.getString(4));
				dto.setRdate(rs.getString(5));
			}
			closeAll();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public List<CustomerDTO> selectAllCustomer() {
		
		List<CustomerDTO> dtoList = new ArrayList<CustomerDTO>();
		
		try {
			conn = getConnection(DBCP);
			
			String sql = "SELECT * FROM CUSTOMER";
			psmt = conn.prepareStatement(sql);
						
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CustomerDTO dto = new CustomerDTO();
				dto.setCid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAddress(rs.getString(4));
				dto.setRdate(rs.getString(5));
				
				dtoList.add(dto);
			}
			closeAll();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dtoList;
	}
	
	public void updateCustomer(CustomerDTO dto) {
		
	}
	
	public void deleteCustomer(String cid) {
		
	}
	
}
