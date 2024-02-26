/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.PetDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Pet;
import validator.Validator;

/**
 *
 * @author Windows 10
 */
public class addpet extends HttpServlet {

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
            request.setCharacterEncoding("UTF-8");
            Validator valid = new Validator();
            String ownerEmail = request.getParameter("ownerEmail");
            String petName = request.getParameter("petname");
            String pexSex = request.getParameter("petSex");
            String petType = request.getParameter("pettype");
            double petWeight = Double.parseDouble(request.getParameter("petweight"));
            double petHeight = Double.parseDouble(request.getParameter("petheight"));
            double petLength = Double.parseDouble(request.getParameter("petlength"));
            String petBehavior = valid.checkStringOptional(request.getParameter("petBehavior"));
            String petFavFood = valid.checkStringOptional(request.getParameter("petFavFood"));
            String petStatus = "active";
            if(valid.checkIfUserAlreadyHasThisPet(petName, ownerEmail)){
                request.setAttribute("erroraddpetmsg", "There is already a pet with this name in your account's pet list");
                request.getRequestDispatcher("/WEB-INF/view/addpet.jsp").forward(request, response);
                return;
            }
            
            Pet newPet = new Pet(ownerEmail, petName, pexSex, petType, petWeight, petHeight, petLength, petStatus, petBehavior, petFavFood);
            PetDAO petDao = new PetDAO();
            petDao.AddPet(newPet);
            ArrayList<Pet> pet_list = petDao.getAllPet(ownerEmail);
            HttpSession session = request.getSession();
            session.setAttribute("userPet", pet_list);
            response.sendRedirect("profile");
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
        request.getRequestDispatcher("/WEB-INF/view/addpet.jsp").forward(request, response);
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
        //request.getRequestDispatcher("/WEB-INF/view/addpet").forward(request, response);
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
