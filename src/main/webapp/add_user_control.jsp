<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
  
 
  String username=request.getParameter("username");
  String email=request.getParameter("email");
  String password=request.getParameter("password");
  String ADD_USER="insert into lms_user values(lms_seq.nextval,?,?,?)";
  try{
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  
	  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","lms","lms");
	  PreparedStatement ps=conn.prepareStatement(ADD_USER);
	  ps.setString(1,username);
	  ps.setString(2,email);
	  ps.setString(3,password);
	  int i=ps.executeUpdate();
	  if(i>0)
	  {
		  response.sendRedirect("view_all_users.jsp?msg=User Added Successfully&color=green");	 
	  }
	  else
	  {
		  response.sendRedirect("view_all_users.jsp?msg=User Insertion  Failed&color=red");	  }
	  
	conn.close();  
	  
  }

  catch(Exception e)
  {
	  e.printStackTrace();
	  response.sendRedirect("view_all_users.jsp?msg=User Insertion  Failed&color=red");	
	
  }
 


%>

</body>
</html>