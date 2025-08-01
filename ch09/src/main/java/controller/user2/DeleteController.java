package controller.user2;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.user2.User2Service;

@WebServlet("/user2/delete.do")
public class DeleteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private User2Service service = User2Service.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String user_id = req.getParameter("user_id");
		
		service.delete(user_id);
		
		resp.sendRedirect("/ch09/user2/list.do");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
