/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Windows 10
 */
public class Booking {
    private int BookId;
    private String PetId;
    private Date BookingDate;
    private Date CheckinDate;
    private Date CheckoutDate;
    private int total;
    private String status;

    public Booking() {
    }

    public Booking(int BookId, String PetId, Date BookingDate, Date CheckinDate, Date CheckoutDate, int total, String status) {
        this.BookId = BookId;
        this.PetId = PetId;
        this.BookingDate = BookingDate;
        this.CheckinDate = CheckinDate;
        this.CheckoutDate = CheckoutDate;
        this.total = total;
        this.status = status;
    }

    public Booking(String PetId, Date BookingDate, Date CheckinDate, Date CheckoutDate, int total, String status) {
        this.PetId = PetId;
        this.BookingDate = BookingDate;
        this.CheckinDate = CheckinDate;
        this.CheckoutDate = CheckoutDate;
        this.total = total;
        this.status = status;
    }

    public Booking(int BookId, String PetId, Date BookingDate, Date CheckinDate, Date CheckoutDate, int total) {
        this.BookId = BookId;
        this.PetId = PetId;
        this.BookingDate = BookingDate;
        this.CheckinDate = CheckinDate;
        this.CheckoutDate = CheckoutDate;
        this.total = total;
    }

    public Booking(String PetId, Date BookingDate, Date CheckinDate, Date CheckoutDate, int total) {
        this.PetId = PetId;
        this.BookingDate = BookingDate;
        this.CheckinDate = CheckinDate;
        this.CheckoutDate = CheckoutDate;
        this.total = total;
    }

    public int getBookId() {
        return BookId;
    }

    public void setBookId(int BookId) {
        this.BookId = BookId;
    }


    public String getPetId() {
        return PetId;
    }

    public void setPetId(String PetId) {
        this.PetId = PetId;
    }

    public Date getBookingDate() {
        return BookingDate;
    }

    public void setBookingDate(Date BookingDate) {
        this.BookingDate = BookingDate;
    }

    public Date getCheckinDate() {
        return CheckinDate;
    }

    public void setCheckinDate(Date CheckinDate) {
        this.CheckinDate = CheckinDate;
    }

    public Date getCheckoutDate() {
        return CheckoutDate;
    }

    public void setCheckoutDate(Date CheckoutDate) {
        this.CheckoutDate = CheckoutDate;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
