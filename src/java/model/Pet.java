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
public class Pet {
    private int petId;
    private String ownerEmail;
    private String petName;
    private String petSex;
    private String petType;
    private double petWeight;
    private double petHeight;
    private double petLength;
    private String petStatus;
    private String petBehavior;
    private String petFavoriteFood;

    public Pet(int petId, String ownerEmail, String petName, String petSex, String petType, double petWeight, double petHeight, double petLength, String petStatus, String petBehavior, String petFavoriteFood) {
        this.petId = petId;
        this.ownerEmail = ownerEmail;
        this.petName = petName;
        this.petSex = petSex;
        this.petType = petType;
        this.petWeight = petWeight;
        this.petHeight = petHeight;
        this.petLength = petLength;
        this.petStatus = petStatus;
        this.petBehavior = petBehavior;
        this.petFavoriteFood = petFavoriteFood;
    }

    public Pet() {
    }

    public Pet(String ownerEmail, String petName, String petSex, String petType, double petWeight, double petHeight, double petLength, String petStatus, String petBehavior, String petFavoriteFood) {
        this.ownerEmail = ownerEmail;
        this.petName = petName;
        this.petSex = petSex;
        this.petType = petType;
        this.petWeight = petWeight;
        this.petHeight = petHeight;
        this.petLength = petLength;
        this.petStatus = petStatus;
        this.petBehavior = petBehavior;
        this.petFavoriteFood = petFavoriteFood;
    }

    public Pet(String ownerEmail, String petName, String petSex, String petType, double petWeight, double petHeight, double petLength, String petStatus) {
        this.ownerEmail = ownerEmail;
        this.petName = petName;
        this.petSex = petSex;
        this.petType = petType;
        this.petWeight = petWeight;
        this.petHeight = petHeight;
        this.petLength = petLength;
        this.petStatus = petStatus;
    }

    public Pet(String ownerEmail, String petName, String petSex, String petType, double petWeight, double petHeight, double petLength, String petStatus, String petFavoriteFood) {
        this.ownerEmail = ownerEmail;
        this.petName = petName;
        this.petSex = petSex;
        this.petType = petType;
        this.petWeight = petWeight;
        this.petHeight = petHeight;
        this.petLength = petLength;
        this.petStatus = petStatus;
        this.petFavoriteFood = petFavoriteFood;
    }

    public int getPetId() {
        return petId;
    }

    public void setPetId(int petId) {
        this.petId = petId;
    }

    public String getOwnerEmail() {
        return ownerEmail;
    }

    public void setOwnerEmail(String ownerEmail) {
        this.ownerEmail = ownerEmail;
    }

    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public String getPetSex() {
        return petSex;
    }

    public void setPetSex(String petSex) {
        this.petSex = petSex;
    }

    public String getPetType() {
        return petType;
    }

    public void setPetType(String petType) {
        this.petType = petType;
    }

    public double getPetWeight() {
        return petWeight;
    }

    public void setPetWeight(double petWeight) {
        this.petWeight = petWeight;
    }

    public double getPetHeight() {
        return petHeight;
    }

    public void setPetHeight(double petHeight) {
        this.petHeight = petHeight;
    }

    public double getPetLength() {
        return petLength;
    }

    public void setPetLength(double petLength) {
        this.petLength = petLength;
    }

    public String getPetStatus() {
        return petStatus;
    }

    public void setPetStatus(String petStatus) {
        this.petStatus = petStatus;
    }

    public String getPetBehavior() {
        return petBehavior;
    }

    public void setPetBehavior(String petBehavior) {
        this.petBehavior = petBehavior;
    }

    public String getPetFavoriteFood() {
        return petFavoriteFood;
    }

    public void setPetFavoriteFood(String petFavoriteFood) {
        this.petFavoriteFood = petFavoriteFood;
    }

    
    
    
}
