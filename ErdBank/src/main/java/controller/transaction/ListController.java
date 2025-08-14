package controller.transaction;

import java.io.IOException;
import java.util.List;

import dto.TransactionDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.TransactionService;

@WebServlet("/transaction/list.do")
public class ListController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	TransactionService service = TransactionService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<TransactionDTO> dtoList = service.findAll();
		req.setAttribute("trans", dtoList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/transaction/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
