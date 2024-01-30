/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Booking;
import model.BookingDetail;

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
        String PetId = request.getParameter("petName");
        String bookingDateStr = java.time.LocalDate.now().toString();
        String checkinDateStr = request.getParameter("checkinDate");
        
        Date bookingDate = java.sql.Date.valueOf(java.time.LocalDate.parse(bookingDateStr));
        Date checkinDate = java.sql.Date.valueOf(java.time.LocalDate.parse(checkinDateStr));
        
        Date CheckoutDate = checkinDate;
        String[] selectedServices = request.getParameterValues("service");
        int total = 0;
        for(int i = 0;i<selectedServices.length;i++){
            if(selectedServices[i].equals("cattia")) total+= 500000;
            else if(selectedServices[i].equals("tuvan")) total+=0;
            else if(selectedServices[i].equals("khamchuabenh")) total+=1000000;
            else if(selectedServices[i].equals("tiemphong")) total+=500000;
            else if(selectedServices[i].equals("spa")) total+=800000;
        }
        Booking book = new Booking(PetId, bookingDate, checkinDate, CheckoutDate, total);
        for(int i = 0;i<selectedServices.length;i++){
            if(selectedServices[i].equals("cattia")){
                BookingDetail detailB = new BookingDetail(book.getBookId(), "ct", 500000);
            }
            else if(selectedServices[i].equals("tuvan")){
                BookingDetail detailC = new BookingDetail(book.getBookId(), "tv", 0);
            }
            else if(selectedServices[i].equals("khamchuabenh")){
                BookingDetail detailD = new BookingDetail(book.getBookId(), "kcb", 1000000);
            }
            else if(selectedServices[i].equals("tiemphong")){
                BookingDetail detailE = new BookingDetail(book.getBookId(), "tp", 500000);
            }
            else if(selectedServices[i].equals("spa")){
                BookingDetail detailF = new BookingDetail(book.getBookId(), "sp", 800000);
            }
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
