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
import model.Service;


/**
 *
 * @author Windows 10
 */
public class ServiceDAO extends DBContext{
   
    public void CreateService(Service service){
        try {
            String sql="INSERT INTO [dbo].[Services] ([Service_name],[Service_status],[Service_price],[Cage_Width],[Cage_Length],[Cage_Height])\n"
                    + "VALUES (?,?,?,?,?,?);";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setNString(1, service.getServiceName());
            ps.setNString(2, service.getServiceStatus());
            ps.setInt(3, service.getServicePrice());
            ps.setFloat(4, service.getCageWidth());
            ps.setFloat(5, service.getCageLength());
            ps.setFloat(6, service.getCageHeight());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void toggleService(int serviceId, String status){
        try {
            String sql="UPDATE [dbo].[Services]\n"
                    + "SET Service_status = ?\n"
                    + "WHERE ServiceId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, serviceId);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Service> GetAllServices(){
        try {
            String sql = "SELECT [ServiceId],[Service_name],[Service_status],[Service_price],[Cage_Width],[Cage_Length],[Cage_Height]\n"
                    + "FROM [dbo].[Services] ORDER BY [ServiceId] ASC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<Service> list_service = new ArrayList<>();
            while(rs.next()){
                Service service = new Service();
                service.setServiceId(rs.getInt("ServiceId"));
                service.setServiceName(rs.getString("Service_name"));
                service.setServiceStatus(rs.getString("Service_status"));
                service.setServicePrice(rs.getInt("Service_price"));
                service.setCageWidth(rs.getFloat("Cage_Width"));
                service.setCageLength(rs.getFloat("Cage_Length"));
                service.setCageHeight(rs.getFloat("Cage_Height"));
                list_service.add(service);
            }
            rs.close();
            ps.close();
            return list_service;
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public Service GetService(int serviceId){
        try {
            String sql = "SELECT [ServiceId],[Service_name],[Service_status],[Service_price],[Cage_Width],[Cage_Length],[Cage_Height]\n"
                    + "FROM [dbo].[Services]\n"
                    + "WHERE [ServiceId] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1,serviceId);
            ResultSet rs = ps.executeQuery();
            Service service = null;
            if(rs.next()){
                service = new Service();
                service.setServiceId(rs.getInt("ServiceId"));
                service.setServiceName(rs.getString("Service_name"));
                service.setServiceStatus(rs.getString("Service_status"));
                service.setServicePrice(rs.getInt("Service_price"));
                service.setCageWidth(rs.getFloat("Cage_Width"));
                service.setCageLength(rs.getFloat("Cage_Length"));
                service.setCageHeight(rs.getFloat("Cage_Height"));
            }
            rs.close();
            ps.close();
            return service;
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void UpdateSerice(Service service) {
        try {
            String sql = "UPDATE [dbo].[Services] \n"
                    + "SET\n"
                    + "[Service_name] = ?,\n"
                    + "[Service_price] = ?,\n"
                    + "[Cage_Width] = ?,\n"
                    + "[Cage_Length] = ?,\n"
                    + "[Cage_Height] = ?\n"
                    + "WHERE [ServiceId] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setNString(1, service.getServiceName());
            ps.setInt(2, service.getServicePrice());
            ps.setFloat(3, service.getCageWidth());
            ps.setFloat(4, service.getCageLength());
            ps.setFloat(5, service.getCageHeight());
            ps.setInt(6,service.getServiceId());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}
