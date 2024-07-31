

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user Login</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-4">
                        <div class="card-header bg-primary">
                            <h3 class="text-center">Login here</h3>
                        </div>
                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
                            
                            <form action="LoginServlet" method="post">
                          <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                           
                          </div>
                          <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                          </div>
                                <a href="register.jsp" class="text-center d-block mb-3">if not registered click here</a>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary border-0">Submit</button>
                                <button type="reset" class="btn btn-warning border-0">reset</button>
                            </div>
                        </form>
                        </div>
                        <div class="card-footer">
                            
                        </div>
                    </div>
                </div>   
            </div>
        </div> 
    </body>
</html>
