
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
        
         <div class="container-fluid">
              <div class="row mt-4">
             <div class="col-md-3 offset-md-3">
                 <div class="card">
                     <div class="card-body px-4">
                         
                         <%@include file="components/message.jsp" %>
                         <h3 class="text-center my-3">Sign_up here!!</h3>
                         <form action="RegisterServlet" method="post">
                            <div class="form-group">
                             <label for="">User Name</label>
                             <input type="text" name="user_name" class="form-control" id="name" placeholder="enter your name" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                             <label for="">User Email</label>
                             <input type="email" name="user_email" class="form-control" id="name" placeholder="enter your email" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                             <label for="">User Password</label>
                             <input type="password"  name="user_password" class="form-control" id="name" placeholder="enter your password" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                             <label for="">User phone</label>
                             <input type="number"  name="user_phone" class="form-control" id="name" placeholder="enter your phone" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                             <label for="">User Address</label>
                             <textarea style="height: 200px"  name="user_address" class="form-control" placeholder="Enter your Address"></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Register</button>
                                <button class="btn btn-outline-werning">Reset</button>
                            </div>
                        </form>
                     </div>
                 </div>
             </div>
         </div>
         </div>
    </body>
</html>
