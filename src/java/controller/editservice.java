/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Service;

/**
 *
 * @author Windows 10
 */
public class editservice extends HttpServlet {

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
            request.setCharacterEncoding("UTF-8");
            
            ServiceDAO serviceDAO = new ServiceDAO();
            Service selectedService = serviceDAO.GetService(Integer.parseInt(request.getParameter("selectedService")));
            
            String newName = request.getParameter("ServiceName");
            if(newName == null || newName.trim().isEmpty()) newName = selectedService.getServiceName();
            
            int newPrice = -1;
            if(request.getParameter("ServicePrice") == null || request.getParameter("ServicePrice").trim().isEmpty()) newPrice = selectedService.getServicePrice();
            else newPrice = Integer.parseInt(request.getParameter("ServicePrice"));
            
            float newCageLength = -1;
            if(request.getParameter("cagelength") == null || request.getParameter("cagelength").trim().isEmpty()) newCageLength = selectedService.getCageLength();
            else newCageLength = Float.parseFloat(request.getParameter("cagelength"));
            
            float newCageWidth = -1;
            if(request.getParameter("cagewidth") == null || request.getParameter("cagewidth").trim().isEmpty()) newCageWidth = selectedService.getCageWidth();
            else newCageWidth = Float.parseFloat(request.getParameter("cagewidth"));
            
            float newCageHeight = -1;
            if(request.getParameter("cageheight") == null || request.getParameter("cageheight").trim().isEmpty()) newCageHeight = selectedService.getCageHeight();
            else newCageHeight = Float.parseFloat(request.getParameter("cageheight"));         
            
            Service updateService = new Service();
            updateService.setServiceId(selectedService.getServiceId());
            updateService.setServiceName(newName);
            updateService.setServicePrice(newPrice);
            updateService.setCageWidth(newCageWidth);
            updateService.setCageLength(newCageLength);
            updateService.setCageHeight(newCageHeight);
            updateService.setServiceStatus(selectedService.getServiceStatus());
            serviceDAO.UpdateSerice(updateService);
            
            response.sendRedirect("manageservice");
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
        int ServiceId = Integer.parseInt(request.getParameter("ServiceId"));
        request.setAttribute("selectedServiceId", ServiceId);
        request.getRequestDispatcher("/WEB-INF/view/editservice.jsp").forward(request, response);
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
