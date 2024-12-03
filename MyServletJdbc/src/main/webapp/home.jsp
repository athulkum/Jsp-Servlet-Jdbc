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
    <h2>Welcome to home <%=name %></h2>
   
</div>
</body>
</html>