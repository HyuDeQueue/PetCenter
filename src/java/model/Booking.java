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
public class Booking {
    private int BookingId;
    private String status;
    private Date BookingDate;
    private String Email;

    public Booking() {
    }

    public Booking(int BookingId, String status, Date BookingDate, String Email) {
        this.BookingId = BookingId;
        this.status = status;
        this.BookingDate = BookingDate;
        this.Email = Email;
    }

    public Booking(String status, Date BookingDate, String Email) {
        this.status = status;
        this.BookingDate = BookingDate;
        this.Email = Email;
    }

    public int getBookingId() {
        return BookingId;
    }

    public void setBookingId(int BookingId) {
        this.BookingId = BookingId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getBookingDate() {
        return BookingDate;
    }

    public void setBookingDate(Date BookingDate) {
        this.BookingDate = BookingDate;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
    
    
    
}
