<%@page import="java.sql.*"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>delete user controller</title>
</head>
<body>

 <%  
  String DELETE="delete from lms_user where user_id=?";
  String u_id=request.getParameter("userid");
  int user_id=Integer.parseInt(u_id);
  try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","lms","lms");
  PreparedStatement ps=conn.prepareStatement(DELETE);
  ps.setInt(1,user_id);
  int i=ps.executeUpdate();
  if(i>0){
	  response.sendRedirect("view_all_users.jsp?msg=Deleted Succesfully&color=green");
  }
  else{
	  response.sendRedirect("view_all_users.jsp?msg=Deletion failed&color=red");
  }
  conn.close();
  }
  catch(Exception e)
  {
	  e.printStackTrace();
	  response.sendRedirect("view_all_users.jsp?msg=Deletion failed&color=red"); 
  }
  
%>

</body>
</html>