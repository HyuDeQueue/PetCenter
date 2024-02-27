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
public class Service {
    private int serviceId;
    private String serviceName;
    private int servicePrice;
    private double CageWidth;
    private double CageLength;
    private double CageHeight;
    private String serviceStatus;

    public Service() {
    }

    public Service(int serviceId, String serviceName, int servicePrice, double CageWidth, double CageLength, double CageHeight, String serviceStatus) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.servicePrice = servicePrice;
        this.CageWidth = CageWidth;
        this.CageLength = CageLength;
        this.CageHeight = CageHeight;
        this.serviceStatus = serviceStatus;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public int getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(int servicePrice) {
        this.servicePrice = servicePrice;
    }

    public double getCageWidth() {
        return CageWidth;
    }

    public void setCageWidth(double CageWidth) {
        this.CageWidth = CageWidth;
    }

    public double getCageLength() {
        return CageLength;
    }

    public void setCageLength(double CageLength) {
        this.CageLength = CageLength;
    }

    public double getCageHeight() {
        return CageHeight;
    }

    public void setCageHeight(double CageHeight) {
        this.CageHeight = CageHeight;
    }

    public String getServiceStatus() {
        return serviceStatus;
    }

    public void setServiceStatus(String serviceStatus) {
        this.serviceStatus = serviceStatus;
    }
    
    
}