<%@ page import="java.sql.*" %>
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
   try{
	  String b_name=request.getParameter("book_name");
      String a_name=request.getParameter("author_name");
      String s=request.getParameter("stock");
      int stock_no=Integer.parseInt(s);
      
	   String INSERT="insert into book values(lms_book_id.nextval,?,?,?,SYSDATE)";
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","lms","lms");
	   PreparedStatement ps=conn.prepareStatement(INSERT);
	   ps.setString(1,b_name);
	   ps.setString(2,a_name);
	   ps.setInt(3,stock_no);
	   int i=ps.executeUpdate();
	   if(i>0)
	   {
		   response.sendRedirect("book_controller.jsp?msg= Book Added Successfully&color=green");
	   }
	   else
	   {
		   response.sendRedirect("book_controller.jsp?msg=Book Insertion Failed&color=red");
	   }
	   conn.close();
	   
   }
 catch(Exception e)
 {
	  response.sendRedirect("book_controller.jsp?msg=Book Insertion Failed&color=red");
 }
 %>
</body>
</html>