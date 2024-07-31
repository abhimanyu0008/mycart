<%@page import="com.learn.mycard.entities.User"%>
<%
    User user1=(User)session.getAttribute("current-user");
%>



<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">mycard</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          category
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
     
    </ul>
      <%
          if(user1==null){      
       %>
        <ul class="navbar-nav ml-auto">
            
            <li class="nav-item active"> 
                <a class="nav-link" href="#" data-toggle="modal" data-target="#cart">
                    <i class="fa fa-cart-plus" style="font-size: 20px; color: yellow;">    
                    </i><span class="ml-3 mt-2 cart-items" style="font-size: 20px">Cart (0)</span> </a>
          </li>
            
          <li class="nav-item active"> 
              <a class="nav-link" href="login.jsp">login</a>
          </li>
          <li class="nav-item active"> 
              <a class="nav-link" href="register.jsp">register</a>
          </li>
      </ul>
       <%
              
          }else{

        %>
            <ul class="navbar-nav ml-auto">
          <li class="nav-item active"> 
              <a class="nav-link" href="<%=user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp"%>"><%=user1.getUserName()%> </a>
          </li>
          <li class="nav-item active"> 
              <a class="nav-link" href="LogoutServlet">Logout</a>
          </li>
      </ul>
        <%
              
          }
      %>
      
      
      
      
  </div>
    </div>
</nav>
