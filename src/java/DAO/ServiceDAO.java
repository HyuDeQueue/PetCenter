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
   
    public void CreateService(){
        try {
            String sql="INSERT INTO [dbo].[Services] ([Service_name],[Service_status],[Service_price],[Cage_Width],[Cage_Length],[Cage_Height])\n"
                    + "VALUES (?,?,?,?,?,?);";
            PreparedStatement ps = connection.prepareStatement(sql);
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

}
