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
import model.Pet;

/**
 *
 * @author Windows 10
 */
public class PetDAO extends DBContext{
    public void AddPet(Pet newPet){
        try {
            String sql = "Insert into [dbo].[Pet] \n"
                    + "([Email],[Pet_name],[Pet_sex],[Pet_type],[Pet_weight],[Pet_height],[Pet_length],[Pet_behavior],[Pet_favorite_food],[Pet_status])\n"
                    + "VALUES(? ,? ,? ,? ,? ,? ,? ,? ,? ,? );";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newPet.getOwnerEmail());
            ps.setNString(2, newPet.getPetName());
            ps.setNString(3, newPet.getPetSex());
            ps.setNString(4, newPet.getPetType());
            ps.setDouble(5, newPet.getPetWeight());
            ps.setDouble(6, newPet.getPetHeight());
            ps.setDouble(7, newPet.getPetLength());
            ps.setNString(8, newPet.getPetBehavior());
            ps.setNString(9, newPet.getPetFavoriteFood());
            ps.setNString(10, newPet.getPetStatus());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(PetDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    public ArrayList<Pet> getAllPet(String ownerEmail){
        
        try {
            ArrayList<Pet> pet_list = new ArrayList<>();
            String sql = "SELECT [Pet_Id],[Email],[Pet_name],[Pet_sex],[Pet_type],[Pet_weight],[Pet_height],[Pet_length],[Pet_behavior],[Pet_favorite_food],[Pet_status]\n"
                    + "FROM [dbo].[Pet]\n"
                    + "WHERE [Email] = ? AND [Pet_status] != 'deleted';";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, ownerEmail);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Pet getPet = new Pet();
                getPet.setPetId(rs.getInt("Pet_Id"));
                getPet.setOwnerEmail(rs.getString("Email"));
                getPet.setPetName(rs.getNString("Pet_name"));
                getPet.setPetSex(rs.getNString("Pet_sex"));
                getPet.setPetType(rs.getNString("Pet_type"));
                getPet.setPetWeight(rs.getDouble("Pet_weight"));
                getPet.setPetHeight(rs.getDouble("Pet_height"));
                getPet.setPetLength(rs.getDouble("Pet_length"));
                getPet.setPetBehavior(rs.getNString("Pet_behavior"));
                getPet.setPetFavoriteFood(rs.getNString("Pet_favorite_food"));
                getPet.setPetStatus(rs.getNString("Pet_status"));
                pet_list.add(getPet);
            }
            rs.close();
            ps.close();
            return pet_list;
        } catch (SQLException ex) {
            Logger.getLogger(PetDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void togglePet(int thisPetId, String thisPetStatus) {
        try {
            String sql = "UPDATE [dbo].[Pet]\n"
                    + "SET [Pet_status] = ?\n"
                    + "WHERE [Pet_Id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setNString(1, thisPetStatus);
            ps.setInt(2, thisPetId);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(PetDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void removePet(int petId){
        try {
            String sql = "UPDATE [dbo].[Pet]\n"
                    + "SET [Pet_status] = 'hidden'\n"
                    + "WHERE [Pet_Id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, petId);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(PetDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean checkSamePetSameMail(String petName, String email){
        try {
            String sql = "SELECT [Pet_Id]\n" +
                         "FROM [dbo].[Pet]\n" +
                         "WHERE [Pet_name] = ? AND [Email] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, petName);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            boolean result = rs.next();
            rs.close();
            ps.close();
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(PetDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public void ChangePetStatusToBooking(int PetId){
        try {
            String sql="UPDATE [dbo].[Pet]\n"
                    + "SET [Pet_status] = 'booking'\n"
                    + "WHERE [Pet_Id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, PetId);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(PetDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Integer> getAllPetByBookingId(int BookingId){
        try {
            String sql="SELECT [Pet_Id]\n"
                    + "FROM [dbo].[Booking_detail]\n"
                    + "WHERE [Booking_Id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, BookingId);
            ResultSet rs = ps.executeQuery();
            
            ArrayList<Integer> allPetIds = new ArrayList<>();
            while(rs.next()){
                int petId = rs.getInt("Pet_Id");
                allPetIds.add(petId);
            }
            rs.close();
            ps.close();
            return allPetIds;
        } catch (SQLException ex) {
            Logger.getLogger(PetDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
