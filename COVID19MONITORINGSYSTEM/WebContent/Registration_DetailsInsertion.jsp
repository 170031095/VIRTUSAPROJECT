<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Details Inserting Into Database</title>
</head>
<body>
<%
String Username=request.getParameter("uname");
String Userphno=request.getParameter("uphno");
String Usertype=request.getParameter("utype");
String Useremail=request.getParameter("umail");
String Userid=request.getParameter("uid");
String Userpwd=request.getParameter("upwd");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:xe", "SYSTEM", "yashu");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into Registration(name,phoneno,usertype,usermail,userid,userpwd)values('"+Username+"','"+Userphno+"','"+Usertype+"','"+Useremail+"','"+Userid+"','"+Userpwd+"')");
out.println("You are Registered Successfully");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<p><a href="Page1_Home.html">Login</a>
</body>
</html>