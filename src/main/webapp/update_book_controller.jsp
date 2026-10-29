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
   String id=request.getParameter("book_id");
   int book_id=Integer.parseInt(id);
   String book_name=request.getParameter("b_name");
   String author_name=request.getParameter("author");
   String stock=request.getParameter("stock");
   int stock_no=Integer.parseInt(stock);
 
   try{
	   String UPDATE="update book set book_name=?,author_name=?,stock=? where book_id=?";
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","lms","lms");
	   PreparedStatement ps=conn.prepareStatement(UPDATE);
	   ps.setString(1,book_name);
	   ps.setString(2,author_name);
	   ps.setInt(3,stock_no);
	   ps.setInt(4,book_id);
	   int i=ps.executeUpdate();
	   if(i>0)
	   {
		   response.sendRedirect("book_controller.jsp?msg= Book Updated Successfully&color=green");
			 
	   }
	   else{
		   response.sendRedirect("book_controller.jsp?msg=Book Updation Failed&color=red");

	   }
	   
	   
	   conn.close();
	   
	   }
	   catch(Exception e)
	   {
		   e.printStackTrace();
		   response.sendRedirect("book_controller.jsp?msg=Book Updation Failed&color=red");

	   }
   %>

</body>
</html>