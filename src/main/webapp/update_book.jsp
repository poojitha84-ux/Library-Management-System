<%@page import="java.sql.*"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update book</title>
<style>
/* ===== GLOBAL ===== */
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins','Segoe UI',sans-serif;
}

/* ===== BACKGROUND ===== */
body{
    min-height:100vh;

    background-image: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.7)),
                      url('https://images.unsplash.com/photo-1495446815901-a7297e633e8d');

    background-size:cover;
    background-position:center;
    background-attachment:fixed;

    color:#e5e7eb;

    display:flex;
    justify-content:center;
    align-items:center;
}

/* ===== FORM CARD ===== */
form{
    background: rgba(0,0,0,0.6);
    padding:35px;
    border-radius:12px;
    border:1px solid rgba(255,255,255,0.08);

    backdrop-filter:blur(10px);
    box-shadow:0 10px 30px rgba(0,0,0,0.8);
}

/* ===== HEADING ===== */
h2{
    text-align:center;
    margin-bottom:20px;
    color:#00c6ff;
}

/* ===== TABLE ===== */
table{
    border-spacing:12px;
}

/* ===== LABEL ===== */
td{
    font-size:14px;
}

/* ===== INPUT ===== */
input[type="text"]{
    width:200px;
    padding:8px 10px;
    border-radius:6px;
    border:1px solid rgba(255,255,255,0.1);
    background: rgba(255,255,255,0.05);
    color:#fff;
}

/* ===== READONLY LABEL ===== */
label{
    color:#9ca3af;
}

/* ===== BUTTON ===== */
input[type="submit"]{
    padding:10px 18px;
    background:#00c6ff;
    color:#000;
    border:none;
    border-radius:6px;
    font-weight:600;
    cursor:pointer;
}

input[type="submit"]:hover{
    background:#00e5ff;
}

/* ===== RESET ===== */
input[type="reset"]{
    padding:10px 18px;
    background: rgba(255,255,255,0.1);
    border:none;
    border-radius:6px;
    color:#fff;
    cursor:pointer;
}

input[type="reset"]:hover{
    background: rgba(255,255,255,0.2);
}
</style>
</head>
<body>
<%  
   int b_id=0;
String b_name=null;
String author=null;
int stock=0;
Date created_at=null;
    
  String UPDATE="select * from book where book_id=?";
  String id=request.getParameter("book_id");
   int book_id=Integer.parseInt(id);
   try{
   Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","lms","lms");
   PreparedStatement ps=conn.prepareStatement(UPDATE);
   ps.setInt(1,book_id);
   ResultSet rs=ps.executeQuery();
   if(rs.next())
   {  
	  b_id=rs.getInt(1);
	  b_name=rs.getString(2);
	  author=rs.getString(3);
	  stock=rs.getInt(4);
	  created_at=rs.getDate(5);
	  
	   
   }
   }
   catch(Exception e)
   {
	   e.printStackTrace();
   }
		   
  %>
<center>
<form action="update_book_controller.jsp">
<h2>Update book</h2>

<table>
  <tr>
  
      <td><label>Book Id:</label></td>
      <td>
    <label><%= b_id %></label>
    <input type="hidden" name="book_id" value="<%= b_id %>"/>
</td>
      
    </tr>
  <tr>
      <td><label>Book Name:</label></td>
      <td> <input type="text" name="b_name"value="<%=b_name%>"/></td>
      </tr>
      <tr>
       <td><label>Author Name:</label></td>
      <td> <input type="text" name="author"value="<%=author%>" /></td>
      </tr>
      <tr>
      <td><label>stock:</label></td>
      <td> <input type="text"name="stock" value="<%=stock%>" /></td>
      </tr>
      <tr>
          <tr>
      <td><label>Created At:</label></td>
      <td> <label><%=created_at%></label></td>
      </tr>
      
          <tr>
      <td><input type="submit" value="update"/></td>
       <td><input type="reset" value="clear"/></td>
      </tr>
      
      
</table>
</form>
</center>
</body>
</html>
