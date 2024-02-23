/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Windows 10
 */
public class Feedback {
    private int FeedbackId;
    private Date FeedbackDate;
    private String Message;
    private int BookingId;

    public Feedback() {
    }

    public Feedback(int FeedbackId, Date FeedbackDate, String Message, int BookingId) {
        this.FeedbackId = FeedbackId;
        this.FeedbackDate = FeedbackDate;
        this.Message = Message;
        this.BookingId = BookingId;
    }

    public Feedback(Date FeedbackDate, String Message, int BookingId) {
        this.FeedbackDate = FeedbackDate;
        this.Message = Message;
        this.BookingId = BookingId;
    }

    public int getFeedbackId() {
        return FeedbackId;
    }

    public void setFeedbackId(int FeedbackId) {
        this.FeedbackId = FeedbackId;
    }

    public Date getFeedbackDate() {
        return FeedbackDate;
    }

    public void setFeedbackDate(Date FeedbackDate) {
        this.FeedbackDate = FeedbackDate;
    }

    public String getMessage() {
        return Message;
    }

    public void setMessage(String Message) {
        this.Message = Message;
    }

    public int getBookingId() {
        return BookingId;
    }

    public void setBookingId(int BookingId) {
        this.BookingId = BookingId;
    }
    
    
}
