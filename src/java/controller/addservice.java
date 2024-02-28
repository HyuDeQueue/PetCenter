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
public class addservice extends HttpServlet {

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
            String name = request.getParameter("servicename");
            String serviceType = request.getParameter("serviceType");
            float cageLength = 0;
            float cageWidth = 0;
            float cageHeight = 0;
            if(serviceType.equals("long")){
                cageLength = Float.parseFloat(request.getParameter("cagelength"));
                cageWidth = Float.parseFloat(request.getParameter("cagewidth"));
                cageHeight =  Float.parseFloat(request.getParameter("cageheight"));
            }
            int ServicePrice = Integer.parseInt(request.getParameter("servicePrice"));
            String serviceStatus = "active";
            Service newService = new Service();
            newService.setServiceName(name);
            newService.setServicePrice(ServicePrice);
            newService.setServiceType(serviceType);
            newService.setServiceStatus(serviceStatus);
            newService.setCageWidth(cageWidth);
            newService.setCageLength(cageLength);
            newService.setCageHeight(cageHeight);
            ServiceDAO serviceDAO = new ServiceDAO();
            serviceDAO.CreateService(newService);
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
        request.getRequestDispatcher("/WEB-INF/view/addservice.jsp").forward(request, response);
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
