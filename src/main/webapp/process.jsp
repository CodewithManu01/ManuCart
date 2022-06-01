<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String Name=request.getParameter("Name");
String Email_address=request.getParameter("Email_address");
String Contact_no=request.getParameter("Contact_no");
String user_feedback=request.getParameter("user_feedback");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/", "root", "");
String database = "manucart";
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into feedback(Name,Email_address,Contact_no,user_feedback)values('"+Name+"','"+Email_address+"','"+Contact_no+"','"+user_feedback+"')");
out.println("Your feedback has been sent successfully ");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>

