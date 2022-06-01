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
  <th scope="col">pId</th>
<th scope="col">pDesc</th>
<th scope="col">pDiscount</th>
<th scope="col">pName</th>
<th scope="col">pPhoto</th>
<th scope="col">pPrice</th>
<th scope="col">pQuantity</th>
<th scope="col">category_categoryId</th>
</tr>
    </thead>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM product";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tbody>
<tr>
    
<td><%=resultSet.getString("pId") %></th>
<td><%=resultSet.getString("pDesc") %></td>
<td><%=resultSet.getString("pDiscount") %></td>
<td><%=resultSet.getString("pName") %></td>
<td><%=resultSet.getString("pPhoto") %></td>
<td><%=resultSet.getString("pPrice") %></td>
<td><%=resultSet.getString("pQuantity") %></td>
<td><%=resultSet.getString("category_categoryId") %></td>
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
