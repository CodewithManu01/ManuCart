
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in !! login first to access the checkout page");
        response.sendRedirect("login.jsp");
        return;
    }




%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <!--card-->
                    <div class="card">
                        <div class="card-body">
                            <h1 class="text-center mb-3">Your selected items</h1>
                            <div class="cart-body">

                            </div>


                        </div>
                    </div>

                </div>
                <div class="col-md-6">
                    <!--form details-->
                    <!--card-->
                    <div class="card">
                        <div class="card-body">
                            <h1 class="text-center mb-5">Your details for order</h1>
                            <form action="#!">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Your name</label>
                                    <input value="<%= user.getUserName()%>"type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Your contact </label>
                                    <input value="<%= user.getUserPhone() %>"type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter contact number">
                                </div>
                                                            

                                
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Your shipping address</label>
                                    <textarea value="<%= user.getUserAddress()%>"class="form-control" id="exampleFormControlTextarea1" placeholder="Enter your addres" rows="3"></textarea>
                                </div>
                                <div class="container text-center">
                                    <a  class="btn btn-outline-success" href="Ordernow.jsp">Order Now</a>
                                    <a  class="btn btn-outline-primary" href="Ordernow.jsp">Continue Shopping</a>
                                </div>
                                
                                    
                            </form>

                        </div>
                    </div>

                </div>
            </div>
        </div>
        <%@ include file="components/common_modals.jsp" %>
    </body>
</html>
