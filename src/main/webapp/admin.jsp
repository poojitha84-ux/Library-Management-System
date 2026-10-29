<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<link rel="stylesheet" href="css/bootstrap-icons.css">

<style>

/* ===== GLOBAL ===== */
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins','Segoe UI',sans-serif;
}

/* 🌙 BACKGROUND (same as login) */
body{
    display:flex;
    background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.7)),
                url('https://images.unsplash.com/photo-1495446815901-a7297e633e8d');
    background-size: cover;
    background-position: center;
    color:#e5e7eb;
}

/* ===== SIDEBAR (BIGGER) ===== */
.sidebar{
    width:260px;
    height:100vh;
    background: rgba(0,0,0,0.7);
    backdrop-filter: blur(10px);
    padding:30px 20px;
    border-right:1px solid rgba(255,255,255,0.08);
}

.sidebar h2{
    text-align:center;
    color:#00c6ff;
    font-size:26px;
    margin-bottom:40px;
}

.sidebar a{
    display:flex;
    align-items:center;
    gap:12px;
    padding:15px;
    margin-bottom:15px;
    text-decoration:none;
    color:#ddd;
    border-radius:10px;
    font-size:16px;
    transition:0.3s;
}

.sidebar a:hover{
    background: rgba(0,198,255,0.2);
    color:#00c6ff;
}

/* ===== MAIN ===== */
.main{
    flex:1;
    display:flex;
    flex-direction:column;
}

/* ===== HEADER (BIGGER) ===== */
header{
    height:90px;
    background: rgba(0,0,0,0.7);
    backdrop-filter: blur(10px);
    display:flex;
    align-items:center;
    padding-left:30px;
    border-bottom:1px solid rgba(255,255,255,0.08);
}

header h1{
    color:#00c6ff;
    font-size:28px;
}

/* ===== CONTENT ===== */
.content{
    flex:1;
    display:flex;
    justify-content:center;
    align-items:center;
}

/* ===== CARD ===== */
.card{
    background: rgba(255,255,255,0.08);
    backdrop-filter: blur(12px);
    padding:60px;
    border-radius:20px;
    text-align:center;
    border:1px solid rgba(255,255,255,0.1);
    box-shadow: 0 15px 40px rgba(0,0,0,0.8);
}

/* ===== TITLE ===== */
.card h2{
    font-size:28px;
    margin-bottom:25px;
}

/* ===== BIG BUTTONS ===== */
.btn{
    display:inline-flex;
    align-items:center;
    gap:10px;

    margin:15px;
    padding:18px 30px;

    font-size:18px;
    font-weight:600;

    background:#00c6ff;
    color:#000;
    text-decoration:none;
    border-radius:30px;

    transition:0.3s;
}

.btn:hover{
    background:#00e5ff;
    transform:scale(1.08);
}

/* ICON SIZE */
.btn i{
    font-size:20px;
}

/* ICON FIX */
i{
    font-family:"bootstrap-icons" !important;
}

</style>

</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <h2>📚 LMS</h2>

    <a href="#"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a href="view_all_users.jsp"><i class="bi bi-people"></i> Users</a>
    <a href="book_controller.jsp"><i class="bi bi-book"></i> Books</a>
     <a href="log_out.jsp"><i class="bi bi-book"></i> Log out</a>
</div>

<!-- MAIN -->
<div class="main">

<header>
    <h1>Admin Dashboard</h1>
</header>

<div class="content">
<% 
String name=request.getParameter("admin_name")==null?"admin":request.getParameter("admin_name");
%>

    <div class="card">
        <h2>Welcome <%=name %> 👋</h2>

        <a href="view_all_users.jsp" class="btn">
            <i class="bi bi-people"></i> Manage Users
        </a>

        <a href="book_controller.jsp" class="btn">
            <i class="bi bi-book"></i> Manage Books
        </a>
    </div>

</div>

</div>

</body>
</html>