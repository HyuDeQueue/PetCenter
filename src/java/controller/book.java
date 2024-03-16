/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.BookingDAO;
import DAO.BookingDetailDAO;
import DAO.PetDAO;
import DAO.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Accounts;
import model.Booking;
import model.BookingDetail;
import model.Pet;
import model.Service;

/**
 *
 * @author Windows 10
 */
public class book extends HttpServlet {

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
            out.println("<title>Servlet book</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet book at " + request.getContextPath() + "</h1>");
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
        Booking newBooking = new Booking();

        newBooking.setStatus("waiting");
        newBooking.setBookingDate(Date.valueOf(LocalDate.now()));

        ServiceDAO serviceDAO = new ServiceDAO();
        ArrayList<Service> allService = serviceDAO.GetAllServices();

        HttpSession session = request.getSession();
        Accounts thisAccount = (Accounts) session.getAttribute("loggedInAccount");
        newBooking.setEmail(thisAccount.getEmail());

        BookingDAO bookingDAO = new BookingDAO();
        int IdOfCurrentBooking = bookingDAO.createBooking(newBooking);

        int numOfPets = 0;
        while (request.getParameter("bookpetId" + numOfPets) != null) {
            numOfPets++;
        }

        String[] serviceIds = new String[numOfPets];
        String[] petIds = new String[numOfPets];
        String checkinDate = request.getParameter("petCheckinDate"); // Shared check-in date
        String checkoutDate = request.getParameter("petCheckoutDate"); // Shared checkout date
        if(request.getParameter("bookType") != null || !request.getParameter("bookType").trim().isEmpty()) checkoutDate=checkinDate;

        for (int i = 0; i < numOfPets; i++) {
            String paramName = "selectedService" + i;
            serviceIds[i] = request.getParameter(paramName);

            paramName = "bookpetId" + i;
            petIds[i] = request.getParameter(paramName);
        }

        ArrayList<BookingDetail> orderDetails = new ArrayList<>();
        PetDAO petDAO = new PetDAO();

        for (int i = 0; i < numOfPets; i++) {
            String petId = petIds[i];
            petDAO.ChangePetStatusToBooking(Integer.parseInt(petId));
            String serviceName = serviceIds[i];
            String CurrentPrice = ""; // Initialize this variable

            for (Service service : allService) {
                if (Integer.parseInt(serviceName) == service.getServiceId()) {
                    CurrentPrice = String.valueOf(service.getServicePrice());
                    break;
                }
            }

            LocalDate checkin = LocalDate.parse(checkinDate);
            LocalDate checkout = LocalDate.parse(checkoutDate);
            long daysBetween = ChronoUnit.DAYS.between(checkin, checkout);
            if(request.getParameter("bookType") != null || !request.getParameter("bookType").trim().isEmpty()) daysBetween = 1;
            int totalPrice = Integer.parseInt(CurrentPrice) * (int) daysBetween;

            BookingDetail detail = new BookingDetail();
            detail.setBookingId(IdOfCurrentBooking);
            detail.setServiceId(Integer.parseInt(serviceName));
            detail.setCheckinDate(Date.valueOf(checkinDate));
            detail.setCheckoutDate(Date.valueOf(checkoutDate));
            detail.setCurrentPrice(totalPrice);
            detail.setPetId(Integer.parseInt(petId));

            orderDetails.add(detail);
        }

        BookingDetailDAO bookingDetailDAO = new BookingDetailDAO();
        for (BookingDetail bd : orderDetails) {
            bookingDetailDAO.createBookingDetail(bd);
        }

        String ownerEmail = request.getParameter("userEmail");
        ArrayList<Pet> userPets = petDAO.getAllPet(ownerEmail);
        session.setAttribute("userPet", userPets);

        response.sendRedirect("mybooking");
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
