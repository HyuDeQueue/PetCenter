/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.PetDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Accounts;
import model.Booking;
import model.BookingDetail;
import model.Pet;

/**
 *
 * @author Windows 10
 */
public class servicebooking extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet servicebooking</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet servicebooking at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        request.getRequestDispatcher("/WEB-INF/view/servicebooking.jsp").forward(request, response);
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
//        for (int id : petIdsInt) {
//            for (Pet pet : allPet) {
//                if (pet.getPetId() == id) {
//                    selectedPet.add(pet);
//                    break; // Break out of inner loop once a match is found
//                }
//            }
//        }
        request.setAttribute("pickedPet", selectedPet);
        
     
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
