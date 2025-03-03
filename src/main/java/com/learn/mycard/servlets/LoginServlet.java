
package com.learn.mycard.servlets;

import com.learn.mycard.dao.UserDao;
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


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            
//            out.println(email);
//            out.println(password+"<br>");

            //validation -correct email or not
            
            //Authentication User
            UserDao userDao=new UserDao(FactoryProvider.getFactory());
            User user=userDao.getUserByEmailAndPassword(email, password);
//            System.out.println(user);
//            out.print(user);
            HttpSession httpSesssion= request.getSession();
            
            if(user==null){
                out.println("<h4>invalid details</h4>");
                httpSesssion.setAttribute("message", "invalid detail try agian !!");
                response.sendRedirect("login.jsp");
                return;
            }else{
                out.println("<h2>Welcome "+user.getUserName()+"</h2>");
                //login
                httpSesssion.setAttribute("current-user", user);
                if(user.getUserType().equals("admin")){
                    response.sendRedirect("admin.jsp");
                }else if(user.getUserType().equals("normal")){
                    response.sendRedirect("normal.jsp");
                }else{
                    out.println("not identify");
                }
                //admin.sp page
                
                //normal.jsp page
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
