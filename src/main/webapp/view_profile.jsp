<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Profile</title>

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

/* profile box */
.profile-box{
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

label{
    color:#9ca3af;
}

/* heading */
h1{
    color:#00c6ff;
    margin-bottom:20px;
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
<div class="profile-box">

<center>
<h1>VIEW YOUR PROFILE</h1>

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
<td><label><%=id %></label></td>
</tr>

<tr>
<td>NAME</td>
<td><label><%=name %></label></td>
</tr>

<tr>
<td>EMAIL</td>
<td><label><%=email %></label></td>
</tr>

<tr>
<td>PASSWORD</td>
<td><label><%=password%></label></td>
</tr>

<!-- ✅ BUTTONS SIDE BY SIDE -->
<tr>
<td colspan="2">
<div style="display:flex; gap:10px;">

<form action="update_profile.jsp" style="flex:1;">
<input type="submit" value="Edit Profile">
</form>

<form action="logout.jsp" style="flex:1;">
<input type="submit" value="Logout">
</form>

</div>
</td>
</tr>

</table>

<!-- ✅ BACK BUTTON BELOW -->
<br>
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

</div>
</div>

</body>
</html>