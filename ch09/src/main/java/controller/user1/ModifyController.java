package controller.user1;

import java.io.IOException;

import dto.user1.User1DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.user1.User1Service;

@WebServlet("/user1/modify.do")
public class ModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private User1Service service = User1Service.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		// 전송데이터 수신
		String user_id = req.getParameter("user_id");
		
		// 수정 데이터 조회
		User1DTO user1DTO = service.findById(user_id);
		
		// request 객체로 조회 데이터 공유
		req.setAttribute("user1DTO", user1DTO);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user1/modify.jsp");
		dispatcher.forward(req, resp);		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// 전송데이터 수신
		String user_id = req.getParameter("user_id");
		String name = req.getParameter("name");
		String hp = req.getParameter("hp");
		String age = req.getParameter("age");
		
		// 서비스 전달을 위한 DTO 생성
		User1DTO dto = new User1DTO();
		dto.setUser_id(user_id);
		dto.setName(name);
		dto.setHp(hp);
		dto.setAge(age);
		
		service.modify(dto);
		
		resp.sendRedirect("/ch09/user1/list.do");
		
	}
	
	
}