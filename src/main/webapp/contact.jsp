
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
        <%@include file="components/common_css_js.jsp" %>
        
        
    </head>
    <body>
                <%@include file = "components/navbar.jsp" %>
               <div class="container">
                   <div class="row mt-5">
                       <div class="col-md-6">
    <section class="contact mt-2">
        <div class="content">
        <div class="container">
            <h1>Contact Us</h1>
        </div>
        </div>
        
        <div class="container md-2">
            <div class="contactInfo">
                <div class="box">
                    <div class="icon"><i class="fa fa-map-marker" aria-hidden="true"></i>
               </div>
                    <div class="text">
                        <h3>Address</h3>
                        <p>BDA Complex Nagarabhavi Main Road,<br> Bangalore,<br>560091</p>
                    </div>
                </div>
                <div class="box">
                    <div class="icon"><i class="fa fa-phone" aria-hidden="true"></i>
                   </div>
                    <div class="text">
                        <h3>Phone</h3>
                        <p>9108704054</p>
                    </div>
                </div>
                <div class="box">
                    <div class="icon"><i class="fa fa-envelope-o" aria-hidden="true"></i>
                                   </div>
                    <div class="text">
                        <h3>Email</h3>
                        <p>manojmanug535@gmail.com</p>
                    </div>
                </div>
            </div>
           
        </div>
    </section>
                       </div>
               <div class="col-md-5">
                    <!--form details-->
                    <!--card-->
                    <div class="card">
                        <div class="card-body">
                            <h2 class="text-center mb-5">Your Details</h2>
                            <form method="post" action="process.jsp">
                                
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Your name</label>
                                    <input type="text"  name="Name" class="form-control" id="#" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="Email_address" class="form-control" id="#" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Your contact </label>
                                    <input type="text" name="Contact_no" class="form-control" id="#" aria-describedby="emailHelp" placeholder="Enter contact number">
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Type Your Message</label>
                                    <textarea class="form-control" name="user_feedback" id="#" placeholder="Enter your message" rows="3"></textarea>
                                </div>
                                <div class="container text-center">
    
                                    <button  class="btn btn-outline-primary" >Send Feedback</button>
                                    <button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
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