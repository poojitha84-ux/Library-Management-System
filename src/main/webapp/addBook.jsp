
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<meta charset="UTF-8">
<title>Add Book</title>

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
    padding:40px;
    border-radius:12px;
    border:1px solid rgba(255,255,255,0.08);
    box-shadow:0 8px 25px rgba(0,0,0,0.6);
}

/* ===== HEADING ===== */
h1{
    text-align:center;
    margin-bottom:20px;
    color:#00c6ff;
}

/* ===== TABLE ===== */
table{
    border-spacing:10px;
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
    border:none;
    outline:none;
}

/* ===== BUTTON ===== */
input[type="submit"]{
    padding:10px 18px;
    background:#00c6ff;
    color:#000;
    border:none;
    border-radius:6px;
    cursor:pointer;
    font-weight:600;
}

input[type="submit"]:hover{
    background:#00e5ff;
}

/* ===== BACK LINK ===== */
a{
    color:#38bdf8;
    text-decoration:none;
    font-weight:500;
}

a:hover{
    text-decoration:underline;
}

</style>
</head>
</head>
<body>

   <center>
   <form action="add_book_controller.jsp">
   <h1>ADD NEW BOOK</h1>
   
     <table>
          <tr>
          <td>enter book name:</td>
          <td> <input type="text"name="book_name"></td>
          </tr>
          <tr>
          <td>enter Author name</td>
          <td> <input type="text"name="author_name"></td>
          </tr>
          <tr>
          <td>stock</td>
          <td> <input type="text"name="stock"></td>
          </tr>
          <tr>
          <td> <input type="submit"value="confirm"></td>
          <td><a href="book_controller.jsp">back</a>
          </tr>
     </table>
     </form>
   </center>

</body>
</html>