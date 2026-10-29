<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Users Management</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<style>

/* SAME CSS AS YOUR BOOK PAGE (NO CHANGE) */
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

.header{
    height:85px;
    background: rgba(0,0,0,0.7);
    display:flex;
    align-items:center;
    justify-content:center;
    border-bottom:1px solid rgba(255,255,255,0.08);
}

.header h1{
    color:#00c6ff;
    font-size:26px;
}

.main{
    padding:40px 20px;
    display:flex;
    flex-direction:column;
    align-items:center;
}

.msg{
    width:100%;
    max-width:950px;
    text-align:center;
    margin-bottom:15px;
    padding:12px 20px;
    border-radius:10px;
    background: rgba(0,0,0,0.6);
    border:1px solid rgba(255,255,255,0.1);
}

.top-bar{
    width:100%;
    max-width:950px;
    display:flex;
    justify-content:flex-end;
    margin-bottom:10px;
}

.add-btn{
    padding:12px 22px;
    background:#00c6ff;
    color:#000;
    text-decoration:none;
    border-radius:8px;
    font-weight:600;
}

.add-btn:hover{
    background:#00e5ff;
}

.card{
    width:100%;
    max-width:950px;
    background: rgba(0,0,0,0.6);
    border-radius:12px;
    overflow:hidden;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    padding:16px;
    background: rgba(0,198,255,0.15);
}

td{
    padding:14px;
    border-bottom:1px solid rgba(255,255,255,0.06);
}

tr:hover{
    background: rgba(0,198,255,0.08);
}

.bi-trash-fill{ color:#ef4444; }
.bi-pencil-square{ color:#facc15; }

.home-btn{
    margin-top:20px;
    padding:12px 25px;
    background:#00c6ff;
    color:#000;
    text-decoration:none;
    border-radius:25px;
    font-size:15px;
    font-weight:600;
    display:inline-flex;
    align-items:center;
    gap:8px;
}

</style>

</head>

<body>

<div class="header">
    <h1>👤 Users Management</h1>
</div>

<%
try{
   String SELECT="select * from lms_user";
   Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","lms","lms");
   PreparedStatement ps=conn.prepareStatement(SELECT);
   ResultSet rs=ps.executeQuery();

   String msg=request.getParameter("msg")==null?"":request.getParameter("msg");
   String color=request.getParameter("color")==null?"#00c6ff":request.getParameter("color");
%>

<div class="main">

    <% if(!msg.equals("")) { %>
    <div class="msg">
        <h3 style="color:<%=color%>;"><%=msg %></h3>
    </div>
    <% } %>

    <div class="top-bar">
        <a href="add_user.jsp" class="add-btn">
            <i class="bi bi-plus-circle"></i> Add User
        </a>
    </div>

    <div class="card">
        <table>

<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Password</th>
    <th>Actions</th>
</tr>

<%
while(rs.next()){
%>

<tr>
    <td><%=rs.getInt(1)%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(3)%></td>
    <td><%=rs.getString(4)%></td>
    <td>
        <a href="delete_user_control.jsp?userid=<%=rs.getInt(1)%>">
            <i class="bi bi-trash-fill"></i>
        </a>
        <a href="update_user.jsp?userid=<%=rs.getInt(1)%>">
            <i class="bi bi-pencil-square"></i>
        </a>
    </td>
</tr>

<%
}
conn.close();
}catch(Exception e){
    e.printStackTrace();
}
%>

        </table>
    </div>

    <!-- ✅ HOME BUTTON RESTORED -->
    <a href="admin.jsp" class="home-btn">
        <i class="bi bi-house-fill"></i> Home
    </a>

</div>

</body>
</html>