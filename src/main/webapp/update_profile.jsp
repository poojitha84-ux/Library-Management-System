<%@page import="java.sql.*"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>

<style>
body{
    min-height:100vh;

    background-image: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.7)),
                      url('https://images.unsplash.com/photo-1495446815901-a7297e633e8d');

    background-size:cover;
    background-position:center;
    background-attachment:fixed;

    color:#e5e7eb;
    font-family:'Poppins','Segoe UI',sans-serif;
}

/* navbar */
.navbar{
    height:85px;
    background: rgba(0,0,0,0.7);
    display:flex;
    align-items:center;
    justify-content:center;
}

.navbar h1{
    color:#00c6ff;
}

/* wrapper */
.wrapper{
    height:calc(100vh - 85px);
    display:flex;
    align-items:center;
    justify-content:center;
}

/* form box */
.form-box{
    background: rgba(0,0,0,0.6);
    padding:30px;
    border-radius:12px;
    backdrop-filter:blur(10px);
    box-shadow:0 10px 30px rgba(0,0,0,0.8);
}

/* table */
table{
    width:100%;
}

td{
    padding:10px;
}

/* heading */
h1{
    color:#00c6ff;
    margin-bottom:20px;
}

/* inputs */
input[type="text"]{
    width:100%;
    padding:10px;
    border-radius:8px;
    border:1px solid rgba(255,255,255,0.1);
    background: rgba(255,255,255,0.05);
    color:#fff;
}

input[type="text"]:focus{
    outline:none;
    border-color:#00c6ff;
}

/* button */
input[type="submit"]{
    width:100%;
    padding:10px;
    background:#00c6ff;
    color:#000;
    border:none;
    border-radius:8px;
    cursor:pointer;
}

input[type="submit"]:hover{
    background:#00e5ff;
}
</style>

</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <h1>Library Management System</h1>
</div>

<!-- WRAPPER -->
<div class="wrapper">
<div class="form-box">

<form action="update_profile_controller.jsp">
<center>
<h1>UPDATE YOUR PROFILE</h1>

<%
try{
   String u_id=session.getAttribute("loggin_id").toString();
   int id=Integer.parseInt(u_id);

   String SELECT="select * from lms_user where user_id=?";
   Class.forName("oracle.jdbc.driver.OracleDriver");

   Connection conn=DriverManager.getConnection(
   "jdbc:oracle:thin:@localhost:1521:XE","lms","lms");

   PreparedStatement ps=conn.prepareStatement(SELECT);
   ps.setInt(1,id);

   ResultSet rs=ps.executeQuery();

   if(rs.next())
   {
     int user_id=rs.getInt(1);
     String name=rs.getString(2);
     String email=rs.getString(3);
     String password=rs.getString(4);
%>

<table>

<tr>
<td>Id</td>
<td>
<label><%=id %></label>
<input type="hidden" name="id" value="<%=id %>">
</td>
</tr>

<tr>
<td>NAME</td>
<td><input type="text" name="name" value="<%=name %>"></td>
</tr>

<tr>
<td>EMAIL</td>
<td><input type="text" name="email" value="<%=email %>"></td>
</tr>

<tr>
<td>PASSWORD</td>
<td><input type="text" name="password" value="<%=password%>"></td>
</tr>

<tr>
<td colspan="2">
<input type="submit" value="Update Profile">
</td>
</tr>

</table>
<a href="user.jsp">
    <button type="button" class="btn">⬅ Back</button>
</a>
<%
   }

}catch(Exception e){
   e.printStackTrace();
}
%>

</center>
</form>

</div>
</div>

</body>
</html>