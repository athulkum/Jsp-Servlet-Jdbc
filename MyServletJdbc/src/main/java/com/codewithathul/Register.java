package com.codewithathul;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class Register extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	                    resp.setContentType("text/html");
	String username =	req.getParameter("username");
	String email    =	req.getParameter("email");
	String password =	req.getParameter("password");
	String city     =	req.getParameter("city");
	PrintWriter out =   resp.getWriter();
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myservletjdbc", "root", "root");
		PreparedStatement ps = con.prepareStatement("insert into users (username,email,password,city) values(?,?,?,?)");
		ps.setString(1, username);
		ps.setString(2, email);
		ps.setString(3, password);
		ps.setString(4, city);
		
	    int count = ps.executeUpdate();
	    if(count > 0) {
	    	
	    	out.println("<h4 style='color:green'>successfully registered</h4>");
	        RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
	        rd.include(req, resp);
	    }else {
	    	out.println("<h4 style='color:red>user not registered</h4>");
	        RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
	        rd.include(req, resp);
	    }
				
	}catch (Exception e) {
		// TODO: handle exception
		out.println("<h4>error occur:-"+e.getMessage()+"</h4>");
		RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
		rd.include(req, resp);
	}
	
	}

}
