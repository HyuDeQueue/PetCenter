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
import model.Accounts;
import model.Pet;
import validator.Validator;

/**
 *
 * @author Windows 10
 */
public class updatepet extends HttpServlet {

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
            int petId = Integer.parseInt(request.getParameter("selectedPetId"));
            PetDAO petDAO = new PetDAO();
            Pet currentPet = petDAO.getPetById(petId);
            
            String petName = request.getParameter("petname");
            if(petName == null || petName.trim().isEmpty()) petName = currentPet.getPetName();
            
            String petSex = request.getParameter("petSex");
            if(petSex == null || petSex.trim().isEmpty()) petSex = currentPet.getPetSex();
            
            String petType = request.getParameter("pettype");
            if(petType == null || petType.trim().isEmpty()) petType = currentPet.getPetType();
            
            double petWeight = -1;
            if(request.getParameter("petweight") == null || request.getParameter("petweight").trim().isEmpty()) petWeight = currentPet.getPetWeight();
            else petWeight = Double.parseDouble(request.getParameter("petweight"));
            
            double petHeight = -1;
            if(request.getParameter("petheight") == null || request.getParameter("petheight").trim().isEmpty()) petHeight = currentPet.getPetHeight();
            else petHeight = Double.parseDouble(request.getParameter("petheight"));        
            
            double petLength = -1;
            if(request.getParameter("petlength") == null || request.getParameter("petlength").trim().isEmpty()) petLength = currentPet.getPetLength();
            else petLength = Double.parseDouble(request.getParameter("petlength"));
            
            
            Validator valid = new Validator();
            String petBehavior;
            if(request.getParameter("petBehavior") == null || request.getParameter("petBehavior").trim().isEmpty()) petBehavior = currentPet.getPetBehavior();
            else petBehavior = valid.checkStringOptional(request.getParameter("petBehavior"));
            String petFavFood;
            if(request.getParameter("petFavFood") == null || request.getParameter("petFavFood").trim().isEmpty()) petFavFood = currentPet.getPetFavoriteFood();
            else petFavFood = valid.checkStringOptional(request.getParameter("petFavFood"));
            
            Pet updatedPet = new Pet();
            updatedPet.setPetId(petId);
            updatedPet.setPetName(petName);
            updatedPet.setPetType(petType);
            updatedPet.setPetSex(petSex);
            updatedPet.setPetWeight(petWeight);
            updatedPet.setPetHeight(petHeight);
            updatedPet.setPetLength(petLength);
            updatedPet.setPetBehavior(petBehavior);
            updatedPet.setPetFavoriteFood(petFavFood);
            
            HttpSession session = request.getSession();
            Accounts thisAccount = (Accounts) session.getAttribute("loggedInAccount");
            petDAO.updatePet(updatedPet);
            ArrayList<Pet> pet_list = petDAO.getAllPet(thisAccount.getEmail());
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
            int petId = Integer.parseInt(request.getParameter("petId"));
            request.setAttribute("selectedPetId", petId);
            request.getRequestDispatcher("/WEB-INF/view/updatepet.jsp").forward(request, response);
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
