<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>lms_login</title>

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
    color:#00c6ff;
    font-size:26px;
}

/* ===== WRAPPER ===== */
.wrapper{
    height:calc(100vh - 85px);
    display:flex;
    align-items:center;
    justify-content:center;
}

/* ===== LOGIN CARD ===== */
.login-card{
    width:100%;
    max-width:420px;

    background: rgba(0,0,0,0.6);
    padding:30px;

    border-radius:12px;
    border:1px solid rgba(255,255,255,0.08);

    backdrop-filter:blur(10px);
    box-shadow:0 10px 30px rgba(0,0,0,0.8);
}

/* ===== HEADER ===== */
.header h2{
    font-size:22px;
    margin-bottom:5px;
    color:#00c6ff;
}

.header p{
    font-size:13px;
    color:#9ca3af;
    margin-bottom:20px;
}

/* ===== FORM ===== */
label{
    font-size:13px;
    color:#9ca3af;
}

input, select{
    width:100%;
    padding:10px;
    margin-top:5px;
    border:1px solid rgba(255,255,255,0.1);
    border-radius:8px;

    background: rgba(255,255,255,0.05);
    color:#fff;
}

/* FIX dropdown text color */
select option{
    color:#000;
}

input:focus, select:focus{
    outline:none;
    border-color:#00c6ff;
    box-shadow:0 0 0 2px rgba(0,198,255,0.2);
}

/* ===== BUTTONS ===== */
.button-row{
    display:flex;
    gap:10px;
}

/* SUBMIT */
input[type="submit"]{
    flex:1;
    padding:10px;
    background:#00c6ff;
    color:#000;
    border:none;
    border-radius:8px;
    font-weight:600;
    cursor:pointer;
}

input[type="submit"]:hover{
    background:#00e5ff;
}

/* RESET */
input[type="reset"]{
    flex:1;
    padding:10px;
    background: rgba(255,255,255,0.1);
    border:none;
    border-radius:8px;
    color:#fff;
    cursor:pointer;
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

<!-- LOGIN -->
<div class="wrapper">

    <div class="login-card">

        <div class="header">
            <h2>Sign in</h2>
            <p>Enter your credentials to continue</p>
        </div>

        <form action="login_control.jsp">

        <table>

            <tr>
                <td>
                    <label>Enter email:</label>
                    <input type="text" name="email"/>
                </td>
            </tr>

            <tr>
                <td>
                    <label>Enter password:</label>
                    <input type="text" name="password"/>
                </td>
            </tr>

            <tr>
                <td>
                    <label>Loggin as:</label>
                    <select name="role">
                        <option>--select--</option>
                        <option>admin</option>
                        <option>user</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>
                    <div class="button-row">
                        <input type="submit" value="Submit"/>
                        <input type="reset" value="Clear"/>
                    </div>
                </td>
            </tr>

        </table>

        </form>

    </div>

</div>

</body>
</html>