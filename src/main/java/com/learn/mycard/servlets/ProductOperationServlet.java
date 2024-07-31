
package com.learn.mycard.servlets;

import com.learn.mycard.dao.CategoryDao;
import com.learn.mycard.dao.ProductDao;
import com.learn.mycard.entities.Category;
import com.learn.mycard.entities.Product;
import com.learn.mycard.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@WebServlet(name = "ProductOperationServlet", urlPatterns = {"/ProductOperationServlet"})
@MultipartConfig 
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            //fetching category
          
            String op= request.getParameter("operation");
            if(op.trim().equals("addcategory")){
                //category
                 String title= request.getParameter("catTitle");
                 String description= request.getParameter("catDescription");
           
//                out.println(title);
//                out.println(desc);

               Category category= new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);
                //category save to database
                CategoryDao categoryDao= new CategoryDao(FactoryProvider.getFactory());
               int catId= categoryDao.saveCategory(category);
//                out.print("category saved");
//                System.out.println("category save");
                
                HttpSession httpSession= request.getSession();
                httpSession.setAttribute("message", "categogy add successfully!!:"+catId);
                response.sendRedirect("admin.jsp");
                return;
                
            }else if(op.trim().equals("addproduct")){
                //product
               String pName= request.getParameter("pName");
               String pDesc= request.getParameter("pDesc");
               int pPrice=Integer.parseInt(request.getParameter("pPrice"));
               int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
               int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
               int catId=Integer.parseInt(request.getParameter("catId"));
//               Part part=request.getPart("pPic");
               
//               out.println(pName);
//               out.println(pDesc);
//               out.println(pPrice);
//               out.println(pDiscount);
//               out.println(pQuantity);
//               out.println(catId);

                  Product p=new Product();
                  p.setpName(pName);
                  p.setpDesc(pDesc);
                  p.setpPrice(pPrice);
                 p.setpDiscount(pDiscount);
                 p.setpQuantity(pQuantity);
//                  p.setpPhoto(part.getSubmittedFileName());
//                 
                 //get category by id
                 
                 CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                 Category category= cdao.getCategoryById(catId);
                 p.setCategory(category);
                 
                 //product save
                 
                 ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);
                //out.println("product save successfull");
                
                //pic upload
                //find out the path to upload photo
//                String path=request.getRealPath("img")
//                        +File.separator+"product"+File.separator+part.getSubmittedFileName();
//                
//                System.out.println(path);
//                
//                //uploading code
//                FileOutputStream fos=new FileOutputStream(path);
//                InputStream is=part.getInputStream();
//                byte[]data=new byte[is.available()];
//                is.read(data);
//                
//                //writng data
//                fos.write(data);
//                fos.close();
//                
                
                HttpSession httpSession= request.getSession();
                httpSession.setAttribute("message", "product is added success!!:");
                response.sendRedirect("admin.jsp");
                return;
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
