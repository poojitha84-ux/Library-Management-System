<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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

/* ===== CONTAINER CENTER ===== */
center{
    width:100%;
}

/* ===== FORM CARD ===== */
form{
    display:inline-block;
    background: rgba(0,0,0,0.6);
    padding:35px;
    border-radius:12px;
    border:1px solid rgba(255,255,255,0.08);

    backdrop-filter:blur(10px);
    box-shadow:0 10px 30px rgba(0,0,0,0.8);
}

/* ===== HEADINGS ===== */
h2{
    color:#00c6ff;
    margin-bottom:5px;
}

h3{
    margin-bottom:20px;
    color:#9ca3af;
}

/* ===== TABLE ===== */
table{
    border-spacing:12px;
}

/* ===== LABEL ===== */
td{
    font-size:14px;
}

/* ===== INPUT ===== */
input[type="text"],
input[type="email"]{
    width:220px;
    padding:8px 10px;
    border-radius:6px;
    border:1px solid rgba(255,255,255,0.1);
    background: rgba(255,255,255,0.05);
    color:#fff;
}

/* ===== BUTTON ===== */
input[type="submit"]{
    padding:10px 20px;
    background:#00c6ff;
    color:#000;
    border:none;
    border-radius:6px;
    font-weight:600;
    cursor:pointer;
}

input[type="submit"]:hover{
    background:#00e5ff;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%
   String user_id=request.getParameter("userid");
   int id=Integer.parseInt(user_id);
   int userid=0;
   String name=null;
   String email=null;
   String password=null;
   String UPDATE="select * from lms_user where user_id=?";
  try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
	  
	  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","lms","lms");
	  PreparedStatement ps=conn.prepareStatement(UPDATE);
	  ps.setInt(1,id);
	  ResultSet rs=ps.executeQuery();
	
	  if(rs.next())
	  { 
		 userid=rs.getInt(1);
		   name=rs.getString(2);
		   email=rs.getString(3);
		   password=rs.getString(4);
	
		 
	  }
	  conn.close();
  }
  catch(Exception e)
  {
	  e.printStackTrace();
  }
%>
   
 

  


    
</head>
<body>
   <center>
<h2>LIBRARY MANAGEMENT SYSTEM</h2>
<h3>UPDATE USER</h3>
<form action="update_user_control.jsp">
   <table>
   <tr>
    <td>User ID</td>
    <td>
        <label><%=userid %></label>
        <input type="hidden" name="id" value="<%=userid %>"/>
    </td>
</tr>
       <tr>
             <td>Enter your name</td>
             <td><input type="text"name="name"value="<%=name%>"></td>
        </tr>
        <tr>
             <td>Enter your email</td>
             <td><input type="email"name="email"value="<%=email%>"/></td>
        </tr>
        <tr>
             <td>Enter your Password</td>
             <td><input type="text"name="password"value="<%=password %>"/></td>
        </tr>
        <tr>
       
             <td><input type="submit"value="Update"/></td>
        </tr>
   </table>
</form>

</center>
</body>
</html>
