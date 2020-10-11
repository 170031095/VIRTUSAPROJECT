<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Dashboard</title>
</head>
<body>
<center><h2 style="color:maroon">Welcome To Admin Dashboard!!!</h2></center>
<br>
<form method="post" >

<b><p>Welcome : <font style="color:red"><%=session.getAttribute("name")%></font> <br> Designation : <font style="color:red"><%=session.getAttribute("usertype")%></font> <br> Employee Mail Id : <font style="color:red"><%=session.getAttribute("usermail")%><br></font></p></b>

<br>

<%
	ResultSet rst=null;
	Statement stmt=null;
	
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:xe", "SYSTEM", "yashu");
		stmt=con.createStatement();
		rst=stmt.executeQuery("select * from patients");
%>
<br>
<center>
			<h2 style="color:indigo">List of Patients</h2>
			<table border="1" cellspacing="0" cellpadding="0">
			<tr>
			    <td><b>SNO</b></td>
				<td><b>ID</b></td>
				<td><b>NAME</b></td>
				<td><b>AGE</b></td>
				<td><b>GENDER</b></td>
				<td><b>PULSERATE</b></td>
				<td><b>BLOODPRESSURE</b></td>
				<td><b>TEMPERATURE</b></td>
			</tr>
			 	<%
				int no=1;
				while(rst.next()){
				%>
				<tr>
				  <td><%=no%></td>
				  <td><%=rst.getString("id")%></td>
				  <td><%=rst.getString("name")%></td>
				  <td><%=rst.getString("age") %></td>
				  <td><%=rst.getString("gender")%></td>
				  <td><%=rst.getString("pulserate")%></td>
				  <td><%=rst.getString("bloodpressure") %></td>
				  <td><%=rst.getString("temp")%></td>
				</tr>
				<% 	
				no++; 
				}
				rst.close();
				stmt.close();
				con.close();
%>
			</table>
			</center>
<%	}
	catch(Exception e)
	{
		System.out.println(e.getMessage());
	}	
%>
<p><a href="LogoutPage.jsp">Logout</a>
</form>
</body>
</html>