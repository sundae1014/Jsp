package controller.lecture;

import java.io.IOException;

import dto.LectureDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.LectureService;

@WebServlet("/lecture/register.do")
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	LectureService service = LectureService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/lecture/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String lecNo = req.getParameter("lecNo");
		String lecName = req.getParameter("lecName");
		String lecCredit = req.getParameter("lecCredit");
		String lecTime = req.getParameter("lecTime");
		String lecClass = req.getParameter("lecClass");
		
		LectureDTO dto = new LectureDTO();
		dto.setLecNo(lecNo);
		dto.setLecName(lecName);
		dto.setLecCredit(lecCredit);
		dto.setLecTime(lecTime);
		dto.setLecClass(lecClass);
		
		service.regist(dto);
		
		resp.sendRedirect("/ErdCollege/lecture/list.do");
	}
	
}






