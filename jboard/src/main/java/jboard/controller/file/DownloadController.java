package jboard.controller.file;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jboard.dto.FileDTO;
import jboard.service.FileService;
/*
 * 날짜 : 2025/09/04
 * 이름 : 정순권
 * 내용 : 파일 다운로드 컨트롤러 개발 
 */
@WebServlet("/file/download.do")
public class DownloadController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private FileService fileService = FileService.INSTANCE;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 다운로드할 파일 번호 수신
		String fno = req.getParameter("fno");
		
		// 다운로드할 파일 정보 조회
		FileDTO fileDTO = fileService.findById(fno);
		logger.debug(fileDTO.toString());
		
		// 파일 다운로드 카운트 업데이트
		fileService.downloadCountPlus(fno);
		
		// 파일 다운로드 수행
		fileService.fileDownload(req, resp, fileDTO);
	}	
}