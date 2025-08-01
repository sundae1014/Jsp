package controller.user2;

import java.io.IOException;

import dto.user2.User2DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.user2.User2Service;

@WebServlet("/user2/register.do")
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private User2Service service = User2Service.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user2/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String user_id = req.getParameter("user_id");
		String name = req.getParameter("name");
		String hp = req.getParameter("hp");
		String age = req.getParameter("age");
		
		User2DTO dto = new User2DTO();
		dto.setUser_id(user_id);
		dto.setName(name);
		dto.setHp(hp);
		dto.setAge(age);
		
		service.register(dto);
		
		resp.sendRedirect("/ch09/user2/list.do");
	}
}
