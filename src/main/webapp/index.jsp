<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Library Management System</title>

<style>

/* 🌙 Professional Dark Background Image */
body {
    margin: 0;
    padding: 0;
    font-family: 'Poppins', 'Segoe UI', sans-serif;

    background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.8)),
                url('https://images.unsplash.com/photo-1495446815901-a7297e633e8d');

    background-size: cover;
    background-position: center;

    height: 100vh;
    color: #f5f5f5;
}

/* 🌟 Center Glass Card */
.container {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    
    background: rgba(255, 255, 255, 0.06);
    padding: 50px 40px;
    border-radius: 20px;
    backdrop-filter: blur(15px);
    text-align: center;

    box-shadow: 0 10px 30px rgba(0,0,0,0.9);
    border: 1px solid rgba(255,255,255,0.08);

    width: 350px;
    transition: 0.3s;
}

/* 🌟 Hover */
.container:hover {
    transform: translate(-50%, -52%);
    box-shadow: 0 15px 40px rgba(0,0,0,1);
}

/* 💡 Heading */
h2 {
    font-size: 34px;
    margin-bottom: 15px;
    letter-spacing: 2px;

    color: #00c6ff;
}

/* 🌟 Subtitle */
p {
    font-size: 15px;
    margin-bottom: 30px;
    color: #ccc;
}

/* 🔘 Button */
a {
    display: inline-block;
    text-decoration: none;
    background: #00c6ff;
    color: black;

    padding: 12px 30px;
    border-radius: 30px;
    font-size: 16px;
    font-weight: 600;

    transition: 0.3s;
}

/* 🔥 Hover */
a:hover {
    background: #00e5ff;
    transform: scale(1.05);
}

</style>

</head>

<body>

<div class="container">
    <h2>📚 Library Management System</h2>
    <p>Manage books, users, and records efficiently</p>
    <a href="login.jsp">Login</a>
</div>

</body>
</html>