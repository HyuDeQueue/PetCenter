/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Windows 10
 */
public class BookingDetail implements Serializable{
    private int DetailId;
    private int currentPrice;
    private Date CheckinDate;
    private Date CheckoutDate;
    private int ServiceId;
    private int BookingId;
    private int PetId;

    public BookingDetail() {
    }

    public BookingDetail(int DetailId, int currentPrice, Date CheckinDate, Date CheckoutDate, int ServiceId, int BookingId, int PetId) {
        this.DetailId = DetailId;
        this.currentPrice = currentPrice;
        this.CheckinDate = CheckinDate;
        this.CheckoutDate = CheckoutDate;
        this.ServiceId = ServiceId;
        this.BookingId = BookingId;
        this.PetId = PetId;
    }

    public int getDetailId() {
        return DetailId;
    }

    public void setDetailId(int DetailId) {
        this.DetailId = DetailId;
    }

    public int getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(int currentPrice) {
        this.currentPrice = currentPrice;
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

    public int getServiceId() {
        return ServiceId;
    }

    public void setServiceId(int ServiceId) {
        this.ServiceId = ServiceId;
    }

    public int getBookingId() {
        return BookingId;
    }

    public void setBookingId(int BookingId) {
        this.BookingId = BookingId;
    }

    public int getPetId() {
        return PetId;
    }

    public void setPetId(int PetId) {
        this.PetId = PetId;
    }
    
    
}
