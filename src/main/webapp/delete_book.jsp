<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete book</title>
</head>
<body>
<% 
String b_id=request.getParameter("bookid");
int id=Integer.parseInt(b_id);
try{
  String DELETE="delete from book where book_id=?";
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","lms","lms");
  PreparedStatement ps=conn.prepareStatement(DELETE);
  ps.setInt(1,id);
  int i=ps.executeUpdate();
  if(i>0){
	   response.sendRedirect("book_controller.jsp?msg=deleted successfully&color=green");
  }
  else{
	  response.sendRedirect("book_controller.jsp?msg=deletion failed&color=red");
  }
  conn.close();
  }
  catch(Exception e)
  {
	  response.sendRedirect("book_controller.jsp?msg=deletion failed&color=red");
  }
  
   %>  
   
</body>
</html>