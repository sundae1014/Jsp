package jboard.controller.comment;

import java.io.IOException;
import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jboard.dto.CommentDTO;
import jboard.service.CommentService;
import jboard.util.ResultCode;

@WebServlet("/comment/write.do")
public class WriteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private CommentService commentService = CommentService.INSTANCE;
	 
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String ano = req.getParameter("ano");
		String content = req.getParameter("content");
		String writer = req.getParameter("writer");
		String regip = req.getRemoteAddr();
		
		CommentDTO dto = new CommentDTO();
		dto.setAno(ano);
		dto.setContent(content);
		dto.setWriter(writer);
		dto.setReg_ip(regip);		
		logger.debug(dto.toString());
		
		CommentDTO savedComment = commentService.register(dto);
		
		//resp.sendRedirect("/jboard/article/view.do?ano="+ano+"&code="+ResultCode.COMMENT_SUCCESS.getCode());
		// JSON 응답 데이터 생성
		Gson gson = new Gson();
		String jsonString = gson.toJson(savedComment);
		
		// JSON 출력
		PrintWriter out = resp.getWriter();
		out.print(jsonString);
		
		
	}

}