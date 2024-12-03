<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style>
       
         body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    nav {
        background-color: #007bff;
        overflow: hidden;
    }
    nav a {
        float: left;
        display: block;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }
    nav a:hover {
        background-color: #0056b3;
        color: black;
    }
    .content {
        padding: 20px;
    }
 
        table {
            width: 50%;
            margin: 20px auto;
            border-collapse: collapse;
            text-align: left;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color:white;
        }
        h1 {
            text-align: center;
        }
        
    </style>
    
</head>
<body>
<%
String name = (String)session.getAttribute("name");
%>
<nav>
    <a href="home.jsp">Home</a>
    <a href="profile.jsp">Profile</a>
    <a href="userdetails.jsp">User Details</a>
    <a href="settings.jsp">Settings</a>
    <a href="logout.jsp">Logout</a>
</nav>
<div class="content">
    <h2>Welcome to userdetails <%=name %></h2>
   
</div>

    <table>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Password</th>
            <th>City</th>
        </tr>
        
       <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyServletJdbc", "root", "root");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM users");

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("password") %></td>
            <td><%= rs.getString("city") %></td>
        </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
        %>
        <tr>
            <td colspan="5" style="color:red; text-align:center;">Error: <%= e.getMessage() %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>