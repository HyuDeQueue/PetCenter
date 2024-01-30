/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Windows 10
 */
public class BookingDetail {
    private int BookingDetailId;
    private int BookingId;
    private String ServiceId;
    private int price;

    public BookingDetail() {
    }

    public BookingDetail(int BookingDetailId, int BookingId, String ServiceId, int price) {
        this.BookingDetailId = BookingDetailId;
        this.BookingId = BookingId;
        this.ServiceId = ServiceId;
        this.price = price;
    }

    public BookingDetail(int BookingId, String ServiceId, int price) {
        this.BookingId = BookingId;
        this.ServiceId = ServiceId;
        this.price = price;
    }

    public int getBookingDetailId() {
        return BookingDetailId;
    }

    public void setBookingDetailId(int BookingDetailId) {
        this.BookingDetailId = BookingDetailId;
    }

    public int getBookingId() {
        return BookingId;
    }

    public void setBookingId(int BookingId) {
        this.BookingId = BookingId;
    }

    public String getServiceId() {
        return ServiceId;
    }

    public void setServiceId(String ServiceId) {
        this.ServiceId = ServiceId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    
}
