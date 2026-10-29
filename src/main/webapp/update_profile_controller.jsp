<%@page import="java.sql.*"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   String user_id=request.getParameter("id");
   int id=Integer.parseInt(user_id);
   String name=request.getParameter("name");
   String email=request.getParameter("email");
   String password=request.getParameter("password");
   String UPDATE="update lms_user set name=?,email=?,password=? where user_id=?";
  try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
	  
	  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","lms","lms");
	  PreparedStatement ps=conn.prepareStatement(UPDATE);
	  ps.setString(1,name);
	  ps.setString(2,email);
	  ps.setString(3,password);
	  ps.setInt(4,id);
	  int i=ps.executeUpdate();
	  if(i>0)
	  {
		  response.sendRedirect("user.jsp?msg=updated successfully&color=green");	  }
	  else
	  {
		  response.sendRedirect("user.jsp?msg=updation failed&color=red");
	  }  
  conn.close();
    
   
  }
  catch(Exception e)
  {
	  e.printStackTrace();
	  response.sendRedirect("user.jsp?msg=updation failed&color=red");
  }
%>

</body>
</html>