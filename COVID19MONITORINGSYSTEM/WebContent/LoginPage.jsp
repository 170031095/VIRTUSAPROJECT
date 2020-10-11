<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%! 
String Umail;
String Uname;
String Upsw;
String Utype;
String Uid;
%>
<%
PreparedStatement ps = null;
ResultSet rs = null;
String usermail = request.getParameter("umail");
String upwd = request.getParameter("upwd");
String usertype = request.getParameter("utype");
usertype=usertype.toUpperCase();
System.out.println(usermail+" "+upwd+" "+usertype);
if((!(usermail.equals(null) || usermail.equals("")) && !(upwd.equals(null) || upwd.equals(""))) && !usertype.equals("select"))
{
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:xe", "SYSTEM", "yashu");
		String sql = "select * from Registration where usermail=? and userpwd=? and usertype=?";
		ps = con.prepareStatement(sql);
		ps.setString(1, usermail);
		ps.setString(2, upwd);
		ps.setString(3, usertype);
		rs = ps.executeQuery();
		if(rs.next())
		{ 
			Umail = rs.getString("usermail");	
			Uname = rs.getString("name");
			Upsw = rs.getString("userpwd");
			Utype = rs.getString("usertype");
			Utype = Utype.toUpperCase();
			
			if(usermail.equals(Umail) && upwd.equals(Upsw) && usertype.equals(Utype))
			{
				System.out.println(Umail+" "+Uname+" "+Upsw+" "+Utype);
				session.setAttribute("usermail", Umail);
				session.setAttribute("name",Uname);
				session.setAttribute("usertype", Utype); 
				if(usertype.equals("ADMIN"))
					response.sendRedirect("AdminPage.jsp"); 
				if(usertype.equals("DOCTOR"))
					response.sendRedirect("DoctorPage.jsp"); 
			}
		}
		else
			response.sendRedirect("ErrorPage.jsp");
		rs.close();
		ps.close();
	}
	catch(SQLException sqe){out.println(sqe);}
	catch(IllegalStateException ise){out.println(ise);}
}
else
{
%>
<center><p style="color:blue">Error In Login</p></center>
<% 
getServletContext().getRequestDispatcher("/Page1_Home.html").include(request,response);
}
%>
</body>
</html>