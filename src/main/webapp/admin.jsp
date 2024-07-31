<%@page import="java.util.Map"%>
<%@page import="com.learn.mycard.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycard.entities.Category"%>
<%@page import="com.learn.mycard.helper.FactoryProvider"%>
<%@page import="com.learn.mycard.dao.CategoryDao"%>
<%@page import="com.learn.mycard.entities.User"%>
<%
   User user=(User) session.getAttribute("current-user");
   if(user==null){
       session.setAttribute("message", "You are login first");
       response.sendRedirect("login.jsp");
       return;
   }else{
       if(user.getUserType().equals("normal")){
           session.setAttribute("message", "You are not admin! do not access");
           response.sendRedirect("login.jsp");
           return;
       }
   }
%>
<% 
    CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
    List<Category>list= cdao.getCategories();
//getting count

   Map<String ,Long>m= Helper.getCounts(FactoryProvider.getFactory());


    %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin panel</title>
   
        <%@include file="components/common_css_js.jsp"%>
         <!--<link rel="stylesheet" href="css/style.css">-->

         
    </head>
    
    <style>
      .admin .card{
        border: 3px solid blue;  
    }
    .admin .card:hover{
        background: #e2e2e2;
        cursor: pointer;
    }
    </style>
    
    <body>
         <%@include file="components/navbar.jsp" %>
        <h3>this is admin page<h3>
         <div class="container admin">
             
             <div class="container-fluid mt-4">
                 <%@include file="components/message.jsp" %>
             </div>
             
             
             <div class="row mt">
                 
                 <!--first column -->
                 <div class="col-md-4">
                     <div class="card">
                         <!--first box-->
                         <div class="card-body text-center">
                             <div class="container">
                                 <img src="img/social.png" class="img-fluid rounded-circle"
                                      style="max-width: 100px" alt="user icon"/>
                             </div>
                             <h2><%=m.get("userCount")%></h2>
                             <h2>User</h2>
                             
                         </div>
                         
                     </div>
                 </div>
                 <!--second column -->
                 <div class="col-md-4">
                     <div class="card">
                         <div class="card-body text-center">
                             <div class="container">
                                 <img src="img/list.png" class="img-fluid rounded-circle"
                                      style="max-width: 100px" alt="user icon"/>
                             </div>
                             <h2><%=list.size()%></h2>
                             <h2>Category</h2>
                             
                         </div>
                         
                     </div>
                 </div>
                 <!--third column -->
                 <div class="col-md-4">
                     <div class="card">
                         <div class="card-body text-center">
                             <div class="container">
                                 <img src="img/product.png" class="img-fluid rounded-circle"
                                      style="max-width: 100px" alt="user icon"/>
                             </div> 
                             <h2><%=m.get("productCount")%></h2>
                             <h2>Product</h2>
                             
                         </div>
                         
                     </div>
                 </div>
                 
             </div>
             <!--second row-->
             <div class="row mt-4">
                 <!--second: row first column-->
                 <div class="col-md-6">
                     <!--first box-->
                     <div class="card" data-toggle="modal" data-target="#add-category-model">
                         <div class="card-body text-center">
                             <div class="container">
                                 <img src="img/plus.png" class="img-fluid rounded-circle"
                                      style="max-width: 100px" alt="user icon"/>
                             </div> 
                             <p>click here to add new category</p>
                             <h2>Add category</h2>
                             
                         </div>
                         
                     </div>
                 </div>
                  <div class="col-md-6">
                      <!--second row second column-->
                     <div class="card" data-toggle="modal" data-target="#add-product-model">
                         <!--second col-->
                         <div class="card-body text-center">
                             <div class="container">
                                 <img src="img/plus-minus.png" class="img-fluid rounded-circle"
                                      style="max-width: 100px" alt="user icon"/>
                             </div> 
                             <p>Click here to add new product</p>
                             <h2>Add Product</h2>
                             
                         </div>
                         
                     </div>
                 </div>
                 
             </div>
         </div>
        
         <!--add category modal-->
         <!-- Button trigger modal -->
<!--    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add-category-model">
      Launch demo modal
    </button>-->

<!-- Modal -->
        <div class="modal fade" id="add-category-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header bg-primary">
                <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <form action="ProductOperationServlet" method="post">
                      <input type="hidden" name="operation" value="addcategory"/>
                      <div class="form-group">
                          <input type="text" class="form-control" name="catTitle" 
                                 placeholder="Enter category tille"/>
                      </div>
                      <div class="form-group">
                          <textarea placeholder="Enter your category description" class="form-control"
                                     name="catDescription" rows="5" cols="10" required></textarea>
                      </div>
                      <div class="container">
                         <button type="submit" class="btn btn-success ">Add Category</button>
                      </div>
                  </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
              </div>
            </div>
          </div>
        </div>
         <!--end category modal-->
         <!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
         
<!--  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add-product-model">
      Launch demo modal
    </button>-->
         <!--add product modal-->
         <!-- Modal -->
        <div class="modal fade" id="add-product-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header bg-primary">
                <h5 class="modal-title" id="exampleModalLabel">Fill product details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <!--from tag-->
                  
                  <form action="ProductOperationServlet" method="post" enctype="mutipart/form-data">
                      
                      <input type="hidden" name="operation" value="addproduct"/>
                      
                      <div class="form-group">
                          <input type="text" class="form-control" name="pName" 
                                 placeholder="Enter Product tille" required/>
                      </div>
                      <div class="form-group">
                          <textarea placeholder="Enter your product description" class="form-control"
                                    name="pDesc" rows="5" cols="10" required></textarea>
                      </div>
                       <div class="form-group">
                          <input type="number" class="form-control" name="pPrice" 
                                 placeholder="Enter Product price" required/>
                       </div>
                       <div class="form-group">
                          <input type="number" class="form-control" name="pDiscount" 
                                 placeholder="Enter Product descount" required/>
                      </div> 
                       <div class="form-group">
                          <input type="number" class="form-control" name="pQuantity" 
                                 placeholder="Enter Product quantity" required/>
                      </div> 
                      <!--product category--> 
                      
                     
                      
                      <div class="form-group">
                          <select name="catId" class="form-control" id="" required>
                              
                              <% 
                               for(Category c:list){
                              %>
                              <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%> </option>
                               <%
                               }
                              %>

                          </select>
                      </div>
                      
                      <!--product file-->
                      <div class="form-group">
                          <lebel for="pPic"> select product picture</lebel>
                          <input type="file" name="pPic" />
                      </div>
                      
                      <div class="container">
                         <button type="submit" class="btn btn-success ">Add Product</button>
                      </div>
                  </form>
                  
                  <!--end form product-->
                  
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
              </div>
            </div>
          </div>
        </div>
         <!--end product modal-->
         <%@include file="components/common_modals.jsp" %>
    </body>
</html>
