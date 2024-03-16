/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.PetDAO;
import DAO.ServiceDAO;
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
import model.Service;

/**
 *
 * @author Windows 10
 */
public class petchoose extends HttpServlet {

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
        HttpSession session = request.getSession();
        Accounts owner = (Accounts) session.getAttribute("loggedInAccount");
        String ownerEmail = owner.getEmail();
        PetDAO petDAO = new PetDAO();
        ArrayList<Pet> list_pet = petDAO.getAllPet(ownerEmail);
        session.setAttribute("list_pet", list_pet);
        request.getRequestDispatcher("/WEB-INF/view/petchoose.jsp").forward(request, response);
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
        
        String[] petIds = request.getParameterValues("pickpetchose");
        if(petIds == null) response.sendRedirect("petchoose");
        int[] petIdsInt = new int[petIds.length];
        for (int i = 0; i < petIds.length; i++) {
            petIdsInt[i] = Integer.parseInt(petIds[i]);
        }
        HttpSession session = request.getSession();
        Accounts thisAccount = (Accounts) session.getAttribute("loggedInAccount");
        String ownerEmail = thisAccount.getEmail();
        PetDAO petDAO = new PetDAO();
        ArrayList<Pet> allPet = petDAO.getAllPet(ownerEmail);
        ArrayList<Pet> selectedPet = new ArrayList<>();
        
        for (int id : petIdsInt) {
            for (Pet pet : allPet) {
                if (pet.getPetId() == id) {
                    selectedPet.add(pet);
                    break;
                }
            }
        }
//        ServiceDAO serviceDAO = new ServiceDAO();
//        ArrayList<Service> allService = serviceDAO.GetAllServices();
//        request.setAttribute("allService", allService);
        
        request.setAttribute("pickedPets", selectedPet);
        String bookingType = request.getParameter("serviceType");
        if(bookingType.equals("shortime")) request.getRequestDispatcher("/WEB-INF/view/samedaybooking.jsp").forward(request, response);
        else if(bookingType.equals("longtime")) request.getRequestDispatcher("/WEB-INF/view/longdaybooking.jsp").forward(request, response);
        else response.sendRedirect("petchoose");
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
