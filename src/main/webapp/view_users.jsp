

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in !! login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userId");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "manucart";
String userId= "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel-Products page</title>
        <%@include file="components/common_css_js.jsp"%>
        
    </head>
    <body>
         <%@include file="components/navbar.jsp"%>
           
         
         <h1 align="center" > Total no of users</h1>
         
<table  class="table table-bordered table-dark">
    <thead>
<tr>
  <th scope="col">user_id</th>
<th scope="col">user_address</th>
<th scope="col">user_email</th>
<th scope="col">user_name</th>
<th scope="col">user_password</th>
<th scope="col">user_phone</th>
<th scope="col">user_pic</th>
<th scope="col">user_type</th>
</tr>
    </thead>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM user";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tbody>
<tr>
    
<td><%=resultSet.getString("user_id") %></th>
<td><%=resultSet.getString("user_address") %></td>
<td><%=resultSet.getString("user_email") %></td>
<td><%=resultSet.getString("user_name") %></td>
<td><%=resultSet.getString("user_password") %></td>
<td><%=resultSet.getString("user_phone") %></td>
<td><%=resultSet.getString("user_pic") %></td>
<td><%=resultSet.getString("user_type") %></td>
</tr>
</tbody>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
        <%@include file="components/common_modals.jsp"%>
    </body>
</html>
