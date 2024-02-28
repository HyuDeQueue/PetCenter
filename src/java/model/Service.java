/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author Windows 10
 */
public class Service implements Serializable{
    private int serviceId;
    private String serviceName;
    private int servicePrice;
    private float CageWidth;
    private float CageLength;
    private float CageHeight;
    private String serviceStatus;

    public Service() {
    }

    public Service(int serviceId, String serviceName, int servicePrice, float CageWidth, float CageLength, float CageHeight, String serviceStatus) {
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

    public float getCageWidth() {
        return CageWidth;
    }

    public void setCageWidth(float CageWidth) {
        this.CageWidth = CageWidth;
    }

    public float getCageLength() {
        return CageLength;
    }

    public void setCageLength(float CageLength) {
        this.CageLength = CageLength;
    }

    public float getCageHeight() {
        return CageHeight;
    }

    public void setCageHeight(float CageHeight) {
        this.CageHeight = CageHeight;
    }

    public String getServiceStatus() {
        return serviceStatus;
    }

    public void setServiceStatus(String serviceStatus) {
        this.serviceStatus = serviceStatus;
    }

    
    
    
}