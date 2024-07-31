

<%@page import="com.learn.mycard.helper.Helper"%>
<%@page import="com.learn.mycard.entities.Category"%>
<%@page import="com.learn.mycard.dao.CategoryDao"%>
<%@page import="com.learn.mycard.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycard.dao.ProductDao"%>
<%@page import="com.learn.mycard.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mycard - home</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <!--<h2> Creating session factory</h2>-->
       <!-- <% 
           out.print( FactoryProvider.getFactory()+"<br>");
           out.print( FactoryProvider.getFactory()+"<br>");
           out.print( FactoryProvider.getFactory());
        %>-->
        <!--show category-->
        <div class="container-fluid">
        <div class="row mt-3 mx-2">
             <%
                 
                 String cat= request.getParameter("category");
//                 out.print(cat);
                    ProductDao dao=new ProductDao(FactoryProvider.getFactory());
                     List<Product>list=null;
                     if(cat==null){
                         list= dao.getAllProducts();
                     }
                     
                    else if(cat.trim().equals("all")){
                        list= dao.getAllProducts();
                    }else {
                       int cid= Integer.parseInt(cat.trim());
                      list= dao.getAllProductsById(cid);
                    }
                   CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                   List<Category>clist=cdao.getCategories();
                %>
            <div class="col-md-2">
                <!--<h2>size of category<%= clist.size()%> </h2>-->
                <div class="list-group mt-2">
                     <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All products
                      </a>
                    
                
                <%
                    for(Category c:clist){
                        
                %>
                  <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
                <%
                    }
                %>
                </div>
            </div>
            <!--show product-->
            <div class="col-md-10">
                <div class="row mt-4">
                    <!--col-12-->
                    <div class="col-md-12">
                        <div class="card-columns">
                            <!--traversing product-->
                            <%
                                for(Product p:list){
                                    
                                
                            %>
                            <!--product card-->
                            <div class="card product-card">
                                <div class="container text-center">
                                     <!--<img class="card-img-top" src="img/products1/<%=p.getpPhoto()%>"style="max-height:270px; max-width:100%; width:auto;"class="card-img-top m-2 alt="Card image cap">-->
                                <img class="card-img-top" src="img/products/laptop1.jpg" alt="Card image cap">
                                
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title"><%=p.getpName()%></h5>
                                    <p class="card-text">
                                        <%=Helper.get10Words(p.getpDesc())%>
                                    </p>
                                </div>
                                    <div class="card-footer text-center">
                                        <button class="btn btn-primary text-white"
                                                onclick="add_to_cart(<%=p.getPid()%>, '<%=p.getpName()%>', '<%=p.getPriceAfterApplyingDiscount()%>')">
                                            Add to card</button>
                                        <button class="btn btn-success text-white">&#8377;
                                            <%=p.getPriceAfterApplyingDiscount()%>/-
                                            <span class="" discount-label">&#8377;<%=p.getpPrice()%>, <%=p.getpDiscount()%>% off</span> </button>
                                    </div>
                            </div>
                            
                            <%}
                                if(list.size()==0){
                                    out.print("<h3>no item in this category</h3>");
                                }
                            %>
                        </div>
                    </div>
                </div>
                
             
                <!--<h1>Number of product is <%= list.size()%></h1>-->
              <!--  <%
                for(Product product:list){
                    out.print(product.getpPhoto()+"<br>");
                   out.print(product.getpName()+"<br>");
                }
                %>  -->
            
            </div> 
        </div>
       </div> 
                
                <%@include file="components/common_modals.jsp" %>
    </body> 
</html>
