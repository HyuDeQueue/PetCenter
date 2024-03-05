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
    public ArrayList<Feedback> getUserFeedback(String email){
        try {
            String sql = "Select f.[FeedbackId],f.[FeedbackDate],f.[Feedback_message],f.[Booking_Id],f.[Feedback_reply]\n"
                    + "FROM [dbo].[Feedback] f INNER JOIN [dbo].[Booking] b ON f.[Booking_Id] = b.[Booking_Id]\n"
                    + "WHERE [Email] = ?\n"
                    + "ORDER by [FeedbackDate] DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            ArrayList<Feedback> list_feedback = new ArrayList<>();
            while(rs.next()){
                Feedback f = new Feedback();
                f.setFeedbackId(rs.getInt("FeedbackId"));
                f.setFeedbackDate(rs.getDate("FeedbackDate"));
                f.setMessage(rs.getNString("Feedback_message"));
                f.setBookingId(rs.getInt("Booking_Id"));
                f.setReplyMessage(rs.getNString("Feedback_reply"));
                list_feedback.add(f);
            }
            rs.close();
            ps.close();
            return list_feedback;
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public ArrayList<Feedback> getAllFeedback(){
        try {
            String sql = "Select f.[FeedbackId],f.[FeedbackDate],f.[Feedback_message],f.[Booking_Id],f.[Feedback_reply]\n" +
"                    FROM [dbo].[Feedback] f INNER JOIN [dbo].[Booking] b ON f.[Booking_Id] = b.[Booking_Id]\n" +
"                    ORDER by [FeedbackDate] DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<Feedback> list_feedback = new ArrayList<>();
            while(rs.next()){
                Feedback f = new Feedback();
                f.setFeedbackId(rs.getInt("FeedbackId"));
                f.setFeedbackDate(rs.getDate("FeedbackDate"));
                f.setMessage(rs.getNString("Feedback_message"));
                f.setBookingId(rs.getInt("Booking_Id"));
                f.setReplyMessage(rs.getNString("Feedback_reply"));
                list_feedback.add(f);
            }
            rs.close();
            ps.close();
            return list_feedback;
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void reply(int feedbackId, String feedbackReply) {
        try {
            String sql= "UPDATE [dbo].[Feedback]\n"
                    + "SET [Feedback_reply] = ?\n"
                    + "WHERE [FeedbackId] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setNString(1, feedbackReply);
            ps.setInt(2, feedbackId);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
