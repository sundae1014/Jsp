package controller.user4;

import java.io.IOException;

import dto.user.User4DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.user.User4Service;


@WebServlet("/user4/modify.do")
public class ModifyController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private User4Service service = User4Service.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid = req.getParameter("uid");
		User4DTO user4DTO = service.findByIb(uid);
		req.setAttribute("user4DTO", user4DTO);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user4/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String hp = req.getParameter("hp");
		String addr = req.getParameter("addr");
		
		User4DTO dto = new User4DTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setGender(gender);
		dto.setAge(age);
		dto.setHp(hp);
		dto.setAddr(addr);
		
		service.modify(dto);
		
		resp.sendRedirect("/ch10/user3/list.do");
	}
}
