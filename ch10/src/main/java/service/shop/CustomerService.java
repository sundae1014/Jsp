package service.shop;

import java.util.List;

import dao.shop.CustomerDAO;
import dto.shop.CustomerDTO;

// 열거형으로 싱글톤 객체 생성
public enum CustomerService {
	
	INSTANCE;
	
	private CustomerDAO dao = CustomerDAO.getInstance();
	
	public void register(CustomerDTO dto) {
		dao.insertCustomer(dto);
	}
	
	public CustomerDTO findById(String cid) {
		dao.selectCustomer(cid);
		return null;
	}
	
	public List<CustomerDTO> findAll() {
		
		dao.selectAllCustomer();
		return null;
	}
	
	public void modify(CustomerDTO dto) {
		dao.updateCustomer(dto);
	}
	
	public void delete(String cid) {
		dao.deleteCustomer(cid);
	}
	
	
}
