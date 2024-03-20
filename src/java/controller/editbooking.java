/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.BookingDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BookingDetail;

/**
 *
 * @author Windows 10
 */
public class editbooking extends HttpServlet {

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
        int BookingId = Integer.parseInt(request.getParameter("bookingId"));
        BookingDetailDAO bddao = new BookingDetailDAO();
        ArrayList<BookingDetail> list_detail = bddao.getDetailOfBooking(BookingId);
        request.setAttribute("list_detail", list_detail);
        request.getRequestDispatcher("/WEB-INF/view/editbooking.jsp").forward(request, response);
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
        // Lấy thông tin chỉnh sửa từ request
        String[] selectedServices = request.getParameterValues("selectedService");
        String[] detailIds = request.getParameterValues("detailId");
        String[] prices = request.getParameterValues("price");

        // Thực hiện cập nhật thông tin vào cơ sở dữ liệu
        BookingDetailDAO bookingDetailDAO = new BookingDetailDAO();
        for (int i = 0; i < selectedServices.length; i++) {
            int detailId = Integer.parseInt(detailIds[i]);
            int serviceId = Integer.parseInt(selectedServices[i]);
            int price = Integer.parseInt(prices[i]);
            bookingDetailDAO.updateDetail(detailId, serviceId, price);
        }

        // Redirect hoặc hiển thị thông báo thành công
        response.sendRedirect("managebooking"); // Chuyển hướng tới trang thông báo thành công
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
