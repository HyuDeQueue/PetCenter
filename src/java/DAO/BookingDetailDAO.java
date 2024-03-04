/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BookingDetail;

/**
 *
 * @author Windows 10
 */
public class BookingDetailDAO extends DBContext{

    public void createBookingDetail(BookingDetail bd) {
        try {
            String sql = "INSERT INTO [dbo].[Booking_detail] ([ServiceId],[Booking_Id],[Pet_Id],[Checkin_Date],[Checkout_Date],[Current_Price])\n"
                    + "VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, bd.getServiceId());
            ps.setInt(2, bd.getBookingId());
            ps.setInt(3, bd.getPetId());
            ps.setDate(4, bd.getCheckinDate());
            ps.setDate(5, bd.getCheckoutDate());
            ps.setInt(6, bd.getCurrentPrice());
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(BookingDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ArrayList<Integer> getAllPetIdByBookingId(int id){
        try {
            String sql= "SELECT [Pet_Id]\n"
                    + "FROM [dbo].[Booking_detail]\n"
                    + "WHERE [Booking_Id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            ArrayList<Integer> petIds = new ArrayList<>();
            while(rs.next()){
                petIds.add(rs.getInt("Pet_Id"));
            }
            rs.close();
            ps.close();
            return petIds;
        } catch (SQLException ex) {
            Logger.getLogger(BookingDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
}
