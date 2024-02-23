/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.AccountsDAO;
import DAO.PetDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Accounts;
import model.Pet;

/**
 *
 * @author Windows 10
 */
public class signin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            
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
        //processRequest(request, response);
        request.getRequestDispatcher("/WEB-INF/view/signin.jsp").forward(request, response);
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
        //processRequest(request, response);
        String email = request.getParameter("email").toLowerCase();
        String password = request.getParameter("password");
        Accounts checkAccount = new Accounts(email, password);
        AccountsDAO accountsDAO = new AccountsDAO();
        Accounts thisAccount = accountsDAO.SigninCheck(checkAccount);
        if(thisAccount == null){
            String msg = "Incorrect email or password";
            request.setAttribute("errorloginmsg", msg);
            request.getRequestDispatcher("/WEB-INF/view/signin.jsp").forward(request, response);
        }else if(thisAccount.getAccountStatus().equals("disabled")){
            String msg = "Your account has been blocked";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("/WEB-INF/view/signin.jsp").forward(request, response);
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("loggedInAccount", thisAccount);
            PetDAO petDAO = new PetDAO();
            ArrayList<Pet> userPet = petDAO.getAllPet(email);
            session.setAttribute("userPet", userPet);
//            if(thisAccount.getRole() == "admin"){
//                ArrayList<Accounts> allAccounts = accountsDAO.getAllAccounts();
//                session.setAttribute("list_accounts", allAccounts);
//            }
            response.sendRedirect("Home");
        }
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
