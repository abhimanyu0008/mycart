<%
    User user=(User) session.getAttribute("current-user");
   if(user==null){
       session.setAttribute("message", "You are login first to access checkout page");
       response.sendRedirect("login.jsp");
       return;
   }
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>checkout</title>
         <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
<!--        <h1>Hello World!</h1>-->
         <%@include file="components/common_modals.jsp" %>
         
         <div class="container">
             <div class="row mt-4">
                 <div class="col-md-6"> 
                     <!--card detail-->
                     <div class="card">
                         <div class="card-body">
                             <div class="cart-body">
                                 
                                 <h3 class="text-center mb-5">Your selected items</h3>
                             </div> 
                         </div>
                     </div>
                 </div>
                 <div class="col-md-6">
                     <!--form details-->
                     <div class="card">
                         <div class="card-body">
                              <h3 class="text-center mb-5">Your details for order</h3>
                              <form action="#">
                                  <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%=user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    
                                  </div>
                                  
                                  <div class="form-group">
                                    <label for="name">Name</label>
                                    <input value="<%=user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">                                    
                                  </div>
                                  
                                  <div class="form-group">
                                    <label for="number">Number</label>
                                    <input value="<%=user.getUserPhone()%>" type="number" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter phone no">                                    
                                  </div>
                                   <div class="form-group">
                                        <label for="exampleFormControlTextarea1">Your shipping Address</label>
                                        <textarea value="<%=user.getUserAddress()%>" class="form-control" id="exampleFormControlTextarea1" 
                                                  placeholder="Enter your address" rows="3"></textarea>
                                    </div>
                                  <div class="container">
                                      <button class="btn btn-outline-success text-center"> order now</button>
                                      <button class="btn btn-outline-primary text-center"> continue shopping</button>
                                  </div>
                              </form>
                         </div>
                     </div>
                 </div>
                     
                
                 
             </div>
             
         </div>
    </body>
</html>
