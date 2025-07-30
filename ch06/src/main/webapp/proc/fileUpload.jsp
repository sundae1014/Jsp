<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.apache.commons.fileupload2.jakarta.servlet6.JakartaServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	String title = request.getParameter("title");
	String name = request.getParameter("name");

	System.out.println("title : "+title+", name : "+name);
	
	// 파일업로드 디렉터리 경로 생성
	String path = application.getRealPath("/files");
	
	// 업로드 파일 Part 생성
	Part part1 = request.getPart("file1");
	Part part2 = request.getPart("file2");
	
	// 파일명 추출
	String header1 = part1.getHeader("content-disposition");
	String header2 = part2.getHeader("content-disposition");
	System.out.println("header1 : " + header1);
	System.out.println("header2 : " + header2);
	
	String[] headers1 = header1.split("filename=");
	String[] headers2 = header2.split("filename=");
	
	String fname1 = headers1[1].trim().replace("\"", ""); // "(따옴표) 제거
	String fname2 = headers2[1].trim().replace("\"", "");
	
	System.out.println("fname1 : " + fname1);
	System.out.println("fname2 : " + fname2);
	
	// 파일 저장
	part1.write(path + "/" + fname1);
	part2.write(path + "/" + fname2);
	
	// 중복되지 않는 파일명 수정
	String ext1 = fname1.substring(fname1.lastIndexOf("."));
	String ext2 = fname2.substring(fname2.lastIndexOf("."));
	
	String newFname1 = UUID.randomUUID().toString() + ext1;
	String newFname2 = UUID.randomUUID().toString() + ext2;
	
	File oNameFile1 = new File(path + "/" + fname1);
	File sNameFile1 = new File(path + "/" + newFname1);
	
	File oNameFile2 = new File(path + "/" + fname2);
	File sNameFile2 = new File(path + "/" + newFname2);
	
	oNameFile1.renameTo(sNameFile1);
	oNameFile2.renameTo(sNameFile2);
	
	
	// 데이터베이스에 원본 파일명 저장(INSERT)
	
	
	// 파일 목록 이동(리다이렉트)
	
	
	
	
%>