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
    private String serviceId;
    private String serviceName;
    private String serviceDescription;
    private String servicePrice;
    private double CageWidth;
    private double CageLength;
    private double CageHeight;
    private String serviceStatus;

    public Service(String serviceId, String serviceName, String serviceDescription, String servicePrice, double CageWidth, double CageLength, double CageHeight, String serviceStatus) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.serviceDescription = serviceDescription;
        this.servicePrice = servicePrice;
        this.CageWidth = CageWidth;
        this.CageLength = CageLength;
        this.CageHeight = CageHeight;
        this.serviceStatus = serviceStatus;
    }

    public Service() {
    }

    public Service(String serviceName, String serviceDescription, String servicePrice, double CageWidth, double CageLength, double CageHeight, String serviceStatus) {
        this.serviceName = serviceName;
        this.serviceDescription = serviceDescription;
        this.servicePrice = servicePrice;
        this.CageWidth = CageWidth;
        this.CageLength = CageLength;
        this.CageHeight = CageHeight;
        this.serviceStatus = serviceStatus;
    }

    public Service(String serviceName, String serviceDescription, String servicePrice, double CageWidth, double CageLength, double CageHeight) {
        this.serviceName = serviceName;
        this.serviceDescription = serviceDescription;
        this.servicePrice = servicePrice;
        this.CageWidth = CageWidth;
        this.CageLength = CageLength;
        this.CageHeight = CageHeight;
    }

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getServiceDescription() {
        return serviceDescription;
    }

    public void setServiceDescription(String serviceDescription) {
        this.serviceDescription = serviceDescription;
    }

    public String getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(String servicePrice) {
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
