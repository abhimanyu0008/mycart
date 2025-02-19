
package com.learn.mycard.servlets;

import com.learn.mycard.entities.User;
import com.learn.mycard.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           try{
              String userName= request.getParameter("user_name");
              String userEmail= request.getParameter("user_email");
              String userPassword= request.getParameter("user_password");
              String userPhone= request.getParameter("user_phone");
              String userAddress= request.getParameter("user_address");
              
              //validation
              if(userName.isEmpty()){
                  out.print("Name is not empty");
                  return;
              }
              if(userEmail.isEmpty()){
                  out.println("email is not empty");
                  return;
              }
              //creating user onject to store data
             User user= new User(userName, userEmail, userPassword, userPhone, "pic.jpg", userAddress,"normal");
              Session hibernateSession= FactoryProvider.getFactory().openSession();
               Transaction tx= hibernateSession.beginTransaction();
              int UserId=(int) hibernateSession.save(user);
               tx.commit();
              hibernateSession.close();
               HttpSession httpsession= request.getSession();
              httpsession.setAttribute("message", "registration successful!!"+UserId);
              response.sendRedirect("register.jsp");
              return;
              
//              out.println("successfully saved");
//              out.print("<br> user id is "+UserId);
//              out.println(userName);
//              out.println(userEmail);
//              out.println(userPassword);
//              out.println(userPhone);
//              out.println(userAddress);

           }catch(Exception e){
               e.printStackTrace();
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
