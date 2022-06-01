
<%@page import="com.mycompany.manucart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in !! login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("admin")) {
            session.setAttribute("message", "You are an admin and you are not allowed to see this");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <%@include file="components/common_css_js.jsp"%>
        <title>JSP Page</title>
    </head>
    <body>
         <%@include file="components/navbar.jsp"%>
        <h1>Hello <%= user.getUserName()%></h1>
        <%@ include file="components/common_modals.jsp" %>
    </body>
</html>
