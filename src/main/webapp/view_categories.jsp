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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
           
         
         <h1 align="center" > Total no of Products</h1>
         
<table  class="table table-bordered table-dark">
    <thead>
<tr>
  <th scope="col">categoryId</th>
<th scope="col">categoryDescription</th>
<th scope="col">categoryTitle</th>


</tr>
    </thead>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM category";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tbody>
<tr>
    
<td><%=resultSet.getString("categoryId") %></th>
<td><%=resultSet.getString("categoryDescription") %></td>
<td><%=resultSet.getString("categoryTitle") %></td>

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
