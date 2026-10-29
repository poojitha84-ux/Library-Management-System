<%@page import="java.sql.*"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Books</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins','Segoe UI',sans-serif;
}

body{
    min-height:100vh;
    background-image: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.7)),
                      url('https://images.unsplash.com/photo-1495446815901-a7297e633e8d');
    background-size:cover;
    background-position:center;
    background-attachment:fixed;
    color:#e5e7eb;
}

/* sidebar */
.sidebar{
    position:fixed;
    top:0;
    left:0;
    width:220px;
    height:100%;
    background:rgba(0,0,0,0.9);
    padding-top:30px;
    box-shadow:5px 0 20px rgba(0,0,0,0.6);
}

.sidebar h2{
    color:#00c6ff;
    text-align:center;
    margin-bottom:30px;
}

.sidebar a{
    display:block;
    color:#e5e7eb;
    padding:12px 20px;
    text-decoration:none;
    font-size:15px;
    transition:0.3s;
}

.sidebar a i{
    margin-right:10px;
}

.sidebar a:hover{
    background:#00c6ff;
    color:#000;
}

/* main */
.main{
    margin-left:220px;
    padding:20px;
}

/* headings */
h1{
    margin-top:20px;
    color:#00c6ff;
}

h2{
    margin-top:10px;
    color:#9ca3af;
}

/* message box */
.msg{
    width:50%;
    margin:20px auto;
    padding:12px;
    background: rgba(0,0,0,0.6);
    border-radius:8px;
    text-align:center;
    font-size:16px;
    box-shadow:0 5px 15px rgba(0,0,0,0.5);
}

/* success */
.msg.success{
    border-left:4px solid #00ff99;
    color:#00ff99;
}

/* error */
.msg.error{
    border-left:4px solid #ff4d4d;
    color:#ff4d4d;
}

/* table */
table{
    width:80%;
    margin:30px auto;
    background: rgba(0,0,0,0.6);
    border-radius:12px;
    overflow:hidden;
    border:1px solid rgba(255,255,255,0.08);
    box-shadow:0 10px 30px rgba(0,0,0,0.8);
    border-collapse:collapse;
}

th{
    padding:16px;
    text-align:center;
    color:#ffffff;
    background: rgba(0,198,255,0.15);
    font-size:14px;
}

td{
    padding:14px;
    text-align:center;
    font-size:14px;
    border-bottom:1px solid rgba(255,255,255,0.06);
}

tr:nth-child(even){
    background: rgba(255,255,255,0.03);
}

tr:hover{
    background: rgba(0,198,255,0.08);
}
</style>
</head>

<body>

<%
String name=request.getParameter("user_name")==null?"user":request.getParameter("user_name");
String msg=request.getParameter("msg")==null?"":request.getParameter("msg");
String type=request.getParameter("type")==null?"success":request.getParameter("type");
%>

<!-- SIDEBAR -->
<div class="sidebar">
    <h2>User</h2>

    <a href="update_profile.jsp"><i class="bi bi-pencil-square"></i> Update Profile</a>
    <a href="view_profile.jsp"><i class="bi bi-person-circle"></i> View Profile</a>
    <a href="log_out.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a>
</div>

<!-- MAIN -->
<div class="main">

<center>

<!-- ✅ MESSAGE -->
<% if(!msg.equals("")) { %>
    <div class="msg <%=type%>">
        <h3><%=msg %></h3>
    </div>
<% } %>

<h1>Welcome <%=name %></h1>
<h2>VIEW ALL AVAILABLE BOOKS</h2>

<%
try{
   String SELECT="select * from book";
   Class.forName("oracle.jdbc.driver.OracleDriver");

   Connection conn=DriverManager.getConnection(
       "jdbc:oracle:thin:@localhost:1521:XE","lms","lms");

   PreparedStatement ps=conn.prepareStatement(SELECT);
   ResultSet rs=ps.executeQuery();
%>

<table>

<tr>
    <th>BOOK ID</th>
    <th>BOOK NAME</th>
    <th>AUTHOR</th>
    <th>STOCK</th>
    <th>CREATED AT</th>
</tr>

<%
while(rs.next()){
%>

<tr>
    <td><%= rs.getInt(1)%></td>
    <td><%= rs.getString(2)%></td>
    <td><%= rs.getString(3)%></td>
    <td><%= rs.getInt(4)%></td>
    <td><%= rs.getDate(5)%></td>
</tr>

<%
}
conn.close();
}catch(Exception e){
    e.printStackTrace();
}
%>

</table>

</center>

</div>

</body>
</html>