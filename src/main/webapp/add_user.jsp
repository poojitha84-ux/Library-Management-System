<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add User</title>

<style>

/* ===== DESIGN SYSTEM ===== */
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

/* ===== NAVBAR ===== */
.navbar{
    height:85px;
    background: rgba(0,0,0,0.7);
    display:flex;
    align-items:center;
    justify-content:center;
    border-bottom:1px solid rgba(255,255,255,0.08);
}

.navbar h1{
    font-size:26px;
    color:#00c6ff;
}

/* ===== WRAPPER ===== */
.wrapper{
    height:calc(100vh - 85px);
    display:flex;
    align-items:center;
    justify-content:center;
}

/* ===== FORM CARD ===== */
.form-card{
    width:100%;
    max-width:420px;
    background: rgba(0,0,0,0.6);
    border:1px solid rgba(255,255,255,0.08);
    border-radius:12px;
    padding:30px;
    box-shadow:0 8px 25px rgba(0,0,0,0.6);
}

/* ===== TITLE ===== */
.form-title{
    font-size:22px;
    font-weight:600;
    margin-bottom:20px;
    color:#00c6ff;
    text-align:center;
}

/* ===== TABLE ===== */
form table{
    width:100%;
}

/* ===== LABEL ===== */
td:first-child{
    font-size:13px;
    color:#9ca3af;
    font-weight:500;
}

/* ===== INPUT ===== */
input[type="text"],
input[type="email"],
input[type="password"]{
    width:100%;
    padding:10px 12px;
    margin-top:6px;
    margin-bottom:14px;
    border:1px solid rgba(255,255,255,0.1);
    border-radius:8px;
    font-size:14px;
    background: rgba(255,255,255,0.05);
    color:#fff;
}

input:focus{
    outline:none;
    border-color:#00c6ff;
    box-shadow:0 0 0 2px rgba(0,198,255,0.2);
}

/* ===== BUTTON ROW ===== */
.button-row{
    display:flex;
    gap:10px;
    margin-top:10px;
}

/* ===== SUBMIT ===== */
input[type="submit"]{
    flex:1;
    padding:10px;
    background:#00c6ff;
    color:#000;
    border:none;
    border-radius:8px;
    font-size:14px;
    cursor:pointer;
    font-weight:600;
}

input[type="submit"]:hover{
    background:#00e5ff;
}

/* ===== RESET ===== */
input[type="reset"]{
    flex:1;
    padding:10px;
    background: rgba(255,255,255,0.1);
    border:none;
    border-radius:8px;
    font-size:14px;
    cursor:pointer;
    color:#fff;
}

input[type="reset"]:hover{
    background: rgba(255,255,255,0.2);
}

</style>

</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <h1>Library Management System</h1>
</div>

<!-- FORM -->
<div class="wrapper">

    <div class="form-card">

        <div class="form-title">Add User</div>

        <form action="add_user_control.jsp">

        <table>

            <tr>
                <td>Enter User Name</td>
                <td><input type="text" name="username"/></td>
            </tr>

            <tr>
                <td>Enter User Email</td>
                <td><input type="email" name="email"/></td>
            </tr>

            <tr>
                <td>Enter User Password</td>
                <td><input type="text" name="password"/></td>
            </tr>

            <tr>
                <td colspan="2">
                    <div class="button-row">
                        <input type="submit" value="Submit"/>
                        <input type="reset" value="Reset"/>
                    </div>
                </td>
            </tr>

        </table>

        </form>

    </div>

</div>

</body>
</html>