<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login control</title>
</head>
<body>
  <%
  try{
  String email=request.getParameter("email");
  String password=request.getParameter("password");
  String role=request.getParameter("role");
  String name=null;
  
  String LOGIN_QUERY=null;
  if(role.equals("user"))
  {
	  LOGIN_QUERY="select * from lms_user where email=? and password=?";
  }
  else if(role.equals("admin"))
  {
	  LOGIN_QUERY="select * from lms_admin where email=? and password=?";  
  }
 
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","lms","lms");
  PreparedStatement ps=conn.prepareStatement(LOGIN_QUERY);
  ps.setString(1,email);
  ps.setString(2,password);
  ResultSet rs=ps.executeQuery();
 
  if(rs.next())
	  
  {
	  int loggin_id=rs.getInt(1);
	  name=rs.getString(2);
    String logged_email=rs.getString(3);
    String logged_password=rs.getString(4);
    session.setAttribute("loggin_id",loggin_id);
    session.setAttribute("loggin_name",name);
    session.setAttribute("loggin_email",logged_email);
    session.setAttribute("loggin_password",logged_password);
    
    if("admin".equals(role))
	  {
		  
		  
		  response.sendRedirect("admin.jsp?admin_name=" + name);
	  }
    if("user".equals(role))
	  {
		  response.sendRedirect("user.jsp?user_name="+name);
	  
	 }
    else{
    	System.out.println("failed");
    }
  }
   conn.close();
  }
  catch(Exception e)
  {
	  e.printStackTrace();
  }
  
  %>
</body>
</html>