<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books Management</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

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
}

/* ===== HEADER ===== */
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

/* ===== MAIN ===== */
.main{
    padding:40px 20px;
    display:flex;
    flex-direction:column;
    align-items:center;
}

/* ===== MESSAGE ===== */
/* ===== MESSAGE BOX ===== */
.msg{
    width:100%;
    max-width:950px;
    text-align:center;
    margin-bottom:15px;

    padding:12px 20px;
    border-radius:10px;

    background: rgba(0,0,0,0.6); /* dark glass */
    backdrop-filter: blur(6px);

    border:1px solid rgba(255,255,255,0.1);

    animation: fadeInOut 3s ease-in-out;
}

/* Text */
.msg h3{
    font-size:16px;
    font-weight:600;
}

/* Animation */
@keyframes fadeInOut{
    0%{ opacity:0; transform:translateY(-10px); }
    10%{ opacity:1; }
    90%{ opacity:1; }
    100%{ opacity:0; }
}
/* ===== TOP BAR ===== */
.top-bar{
    width:100%;
    max-width:950px;
    display:flex;
    justify-content:flex-end;
    margin-bottom:10px;
}

/* ===== ADD BUTTON ===== */
.add-btn{
    padding:12px 22px;
    background:#00c6ff;
    color:#000;
    text-decoration:none;
    border-radius:8px;
    font-size:15px;
    font-weight:600;
    transition:0.3s;
}

.add-btn:hover{
    background:#00e5ff;
    transform:scale(1.05);
}

/* ===== CARD ===== */
.card{
    width:100%;
    max-width:950px;
    background: rgba(0,0,0,0.6);
    border-radius:12px;
    overflow:hidden;
    border:1px solid rgba(255,255,255,0.08);
    box-shadow:0 8px 25px rgba(0,0,0,0.6);
}

/* ===== TABLE ===== */
table{
    width:100%;
    border-collapse:collapse;
}

/* ===== HEADER ===== */
th{
    padding:16px;
    text-align:left;
    font-size:14px;
    color:#ffffff;
    background: rgba(0,198,255,0.15);
}

/* ===== DATA ===== */
td{
    padding:16px;
    font-size:15px;
    border-bottom:1px solid rgba(255,255,255,0.06);
}

/* ===== ROW COLORS ===== */
tr:nth-child(even){
    background: rgba(255,255,255,0.03);
}

/* ===== HOVER ===== */
tr:hover{
    background: rgba(0,198,255,0.08);
}

/* ===== ACTION ICONS ===== */
td a{
    margin-right:10px;
    font-size:18px;
    padding:6px;
    border-radius:6px;
    transition:0.3s;
}

/* DELETE */
.bi-trash-fill{
    color:#ef4444;
}
td a:hover .bi-trash-fill{
    background:#ef4444;
    color:#fff;
}

/* EDIT */
.bi-pencil-square{
    color:#facc15;
}
td a:hover .bi-pencil-square{
    background:#facc15;
    color:#000;
}
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

.fa-house{
    color:#38bdf8;
    font-size:18px;
}

</style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    <h1>📚 Books Management</h1>
</div>

<%
try{
   String SELECT="select * from book";
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
        <a href="addBook.jsp" class="add-btn">
            <i class="bi bi-plus-circle"></i> Add Book
        </a>
    </div>

    <div class="card">
        <table>

<tr>
    <th>BOOK ID</th>
    <th>BOOK NAME</th>
    <th>AUTHOR</th>
    <th>STOCK</th>
    <th>CREATED AT</th>
    <th>ACTIONS</th>
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
    <td>
        <a href="delete_book.jsp?bookid=<%=rs.getInt(1)%>" onclick="return confirmDelete();">
            <i class="bi bi-trash-fill"></i>
        </a>
        <a href="update_book.jsp?book_id=<%=rs.getInt(1)%>">
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

    <a href="admin.jsp" class="home-btn">
        <i class="bi bi-house-fill"></i> Home
    </a>

</div>
        
    </div>

</div>




</body>
</html>