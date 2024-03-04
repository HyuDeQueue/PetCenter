/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feedback;

/**
 *
 * @author Windows 10
 */
public class FeedbackDAO extends DBContext{
    public void createFeedback(Feedback feedback){
        try {
            String sql = "INSERT INTO [dbo].[Feedback] ([Booking_Id],[Feedback_message],[FeedbackDate])\n"
                    + "VALUES (?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, feedback.getBookingId());
            ps.setNString(2, feedback.getMessage());
            ps.setDate(3, feedback.getFeedbackDate());
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
