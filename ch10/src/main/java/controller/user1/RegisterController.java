package controller.user1;

import java.io.IOException;

import dto.user.User1DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.user.User1Service;


@WebServlet("/user1/register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private User1Service service = User1Service.INSTANCE;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user1/register.jsp");
		dispatcher.forward(req, resp);		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// 전송 데이터 수신
		String uid = req.getParameter("uid");
		String name = req.getParameter("name");
		String hp = req.getParameter("hp");
		String age = req.getParameter("age");
		
		User1DTO dto = new User1DTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setHp(hp);
		dto.setAge(age);

		service.register(dto);

		
		// 이동
		resp.sendRedirect("/ch10/user1/list.do");
		
	}
	
	
}