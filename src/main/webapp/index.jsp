<%-- 
    Document   : index
    Created on : 28-Jun-2021, 11:06:24 AM
    Author     : SLIM3 80IN
--%>

<%@page import="com.mycompany.manucart.helper.helper"%>
<%@page import="com.mycompany.manucart.entities.Category"%>
<%@page import="com.mycompany.manucart.dao.CategoryDao"%>
<%@page import="com.mycompany.manucart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.manucart.dao.ProductDao"%>
<%@page import="com.mycompany.manucart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ManuCart - Home</title>
        <%@include file="components/common_css_js.jsp" %>

    </head>

    <body>
        <%@include file = "components/navbar.jsp" %>
        <div class="container-fluid">
        <div class="row mt-3 mx-2">
            
            <%  String cat = request.getParameter("category");
           
            
           // out.println(cat);
            
            ProductDao dao = new ProductDao(FactoryProvider.getfactory());
            List<Product> list = null;
            
           if(cat==null || cat.trim().equals("all")){
                list=dao.getAllProducts();
            }else {
            int cid=Integer.parseInt(cat.trim());
            list=dao.getAllProductsById(cid);
            
            
           
            }
                CategoryDao cdao = new CategoryDao(FactoryProvider.getfactory());
                List<Category> clist = cdao.getCategories();


            %>

            <!--show categories-->
            <div class="col-md-2">
                <div class="list-group mt-4">
                    <a href="index.jsp?category= all" class="list-group-item list-group-item-action active">
                        ALL Products
                    </a>
               

                <%                    for (Category c : clist) {
                    
                    %>
               <a href="index.jsp?category=<%=c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>

                        
                 <%
                    }

                %>
                 </div>
            </div>
            <!--show products-->
            <div class="col-md-10">
                
               <!--row-->
               
               <div class="row mt-4">
                   <!--Col:12-->
                   <div class="col-md-12">
                       
                       <div class="card-columns">
                         <!--traversing products-->
                         <%
                             for(Product p:list){
                             
                           %>
                           
                           <!--product-card-->
                           <div class="card product-card">
                               <div class ="container text-center mt-3">
                             
                       <img class="card-img-top" src="img/product/<%= p.getpPhoto() %>"style="max-height: 200px; max-width: 100%; width:auto;" alt="..." >
                             
                               </div>
                               <div class="card-body">
                                   <h5 class="card-title"> <%= p.getpName()%></h5>
                                   
                                   <p class="card-text">
                                       <%= helper.get10Words(p.getpDesc()) %>
                                   </p>
                               </div>
                                   <div class="card-footer text-center">
                                       <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId() %> ,'<%= p.getpName() %>' ,<%= p.getPriceAfterApplyingDiscount() %> ) ">Add to Cart</button>
                                     
                                  <button class="btn btn-outline-success"> &#8377; <%= p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-label">&#8377;<%= p.getpPrice() %>, <%= p.getpDiscount()%>% off</span></button>
                                       </div>
                               
                           </div>
                           
                           
                        <% }
                                  if(list.size()== 0){
                              out.println("<h3>No item in this category</h3>");
                                  }
                          %>
                       </div>
                       
                       
                       
                       
                   </div>
               </div>





        </div>


        </div>

<%@ include file="components/common_modals.jsp" %>

<!---footer-->
<div class ="footer">
    <div class ="container">
        <div class="row">
            <div class="footer-col-1">
                <h3>Download Our App</h3>
                <p>Download App for Android and ios mobile phone.</p>
                <div class="app-logo">
                    <img src="img/play-store.png">
                    <img src="img/app-store.png">
                </div>
                
                </div>
            <div class="footer-col-2">
                <img src="img/logo.png">
                
                <p>Our Purpose is To Sustainably Make the Pleasure and Benefits of All the Products Accessible to Everyone</p>
                </div>
            <div class="footer-col-3">
                <h3>Useful Links</h3>
                <ul>
                  <li>Coupons</li>  
                   <li>Blog Post</li>
                   <li>Return Policy</li>
                   <li>Join Affiliate</li>
                </ul>
                </div>
            <div class="footer-col-4">
                   <h3>Follow us</h3>
                <ul>
                  <li>Facebook</li>  
                   <li>Twitter</li>
                   <li>Instagram</li>
                   <li>Youtube</li>
                   
                </ul>
                </div>
        </div>
        <hr>
        <p class="copyright"> Copyright &copy;  2021 - ManuCart</p>
        </div>
    
</div>
    </body>
</html>
