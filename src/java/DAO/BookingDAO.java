/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Booking;

/**
 *
 * @author Windows 10
 */
public class BookingDAO extends DBContext {

    public int createBooking(Booking newBooking) {
        int generatedId = -1; // Initialize with a default value

        try {
            String sql = "INSERT INTO [dbo].[Booking] ([Email],[Booking_Date],[Status]) VALUES (?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, newBooking.getEmail());
            ps.setDate(2, newBooking.getBookingDate());
            ps.setNString(3, newBooking.getStatus());

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    generatedId = generatedKeys.getInt(1); // Retrieve the generated ID
                }
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return generatedId;
    }

    public ArrayList<Booking> getUserBooking(String email) {
        try {
            String sql = "SELECT [Booking_Id],[Status],[Booking_Date]\n"
                    + "FROM [dbo].[Booking]\n"
                    + "WHERE [Email] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            ArrayList<Booking> userBookings = new ArrayList<>();
            while(rs.next()){
                Booking aBooking = new Booking();
                aBooking.setEmail(email);
                aBooking.setBookingId(rs.getInt("Booking_Id"));
                aBooking.setStatus(rs.getNString("Status"));
                aBooking.setBookingDate(rs.getDate("Booking_Date"));
                userBookings.add(aBooking);
            }
            rs.close();
            ps.close();
            return userBookings;
        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void toggleBooking(int BookingId, String status) {
        try {
            String sql="UPDATE [dbo].[Booking]\n"
                    + "SET [Status] = ?\n"
                    + "WHERE [Booking_Id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setNString(1,status);
            ps.setInt(2, BookingId);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Booking> GetAllBooking(){
        try {
            String sql = "SELECT [Booking_Id],[Status],[Booking_Date],[Email]\n"
                    + "FROM [dbo].[Booking]";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<Booking> allBooking = new ArrayList<>();
            while(rs.next()){
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt(1));
                booking.setStatus(rs.getNString("Status"));
                booking.setBookingDate(rs.getDate("Booking_Date"));
                booking.setEmail(rs.getString("Email"));
                allBooking.add(booking);
            }
            rs.close();
            ps.close();
            return allBooking;
        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
