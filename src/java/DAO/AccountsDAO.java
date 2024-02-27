/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Accounts;
import at.favre.lib.crypto.bcrypt.BCrypt;
import java.util.ArrayList;

/**
 *
 * @author Windows 10
 */
public class AccountsDAO extends DBContext{
    public Accounts SigninCheck(Accounts account) {
        try {
            String sql = "SELECT [Email],[Password],[First_Name],[Last_name],[User_sex],[Phone],[Role],[Account_status]\n"
                    + "From [dbo].[Account]\n"
                    + "Where [Email] = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, account.getEmail());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String hashedPasswordFromDatabase = rs.getString("Password");
                String userProvidedPassword = account.getPassword();

                if (BCrypt.verifyer().verify(userProvidedPassword.toCharArray(), hashedPasswordFromDatabase).verified) {
                    Accounts foundAccount = new Accounts();
                    foundAccount.setEmail(rs.getString("Email"));
                    foundAccount.setRole(rs.getNString("Role"));
                    foundAccount.setAccountStatus(rs.getNString("Account_status"));
                    foundAccount.setFirstName(rs.getNString("First_Name"));
                    foundAccount.setLastName(rs.getNString("Last_name"));
                    foundAccount.setPhone(rs.getNString("Phone"));
                    foundAccount.setSex(rs.getNString("User_sex"));
                    rs.close();
                    ps.close();
                    return foundAccount;
                }
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(AccountsDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    public void CreateAccount(Accounts accounts){
        try {
            String sql = "INSERT Into [dbo].[Account] ([Email],[Password],[First_Name],[Last_name],[User_sex],[Phone],[Role],[Account_status])\n"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, accounts.getEmail());
            ps.setNString(2, BCrypt.withDefaults().hashToString(12, accounts.getPassword().toCharArray()));
            ps.setNString(3, accounts.getFirstName());
            ps.setNString(4, accounts.getLastName());
            ps.setNString(5, accounts.getSex());
            ps.setNString(6, accounts.getPhone());
            ps.setNString(7, accounts.getRole());
            ps.setNString(8, accounts.getAccountStatus());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
//    public ArrayList<Accounts> getAllAccounts(){
//        try {
//            String sql = "SELECT [Email],[First_Name],[Last_name],[User_sex],[Phone],[Role],[Account_status]\n"
//                    + "FROM [dbo].[Account]";
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            ArrayList<Accounts> AccountList = new ArrayList<>();
//            while(rs.next()){
//                Accounts account = new Accounts();
//                account.setEmail(rs.getString("Email")); 
//                account.setFirstName(rs.getString("First_Name")); 
//                account.setLastName(rs.getString("Last_name")); 
//                account.setSex(rs.getString("User_sex")); 
//                account.setPhone(rs.getString("Phone"));
//                account.setRole(rs.getString("Role"));
//                account.setAccountStatus(rs.getString("Account_status"));
//                AccountList.add(account);
//            }
//            rs.close();
//            ps.close();
//            return AccountList;
//        } catch (SQLException ex) {
//            Logger.getLogger(AccountsDAO.class.getName()).log(Level.SEVERE, null, ex);
//            return null;
//        }
//    }
    public ArrayList<Accounts> getAllAccounts(){
        try {
            String sql = "SELECT [First_Name],[Last_name],[User_sex],[Phone],[Email],[Role],[Account_status]\n"
                    + "FROM [dbo].[Account]";
            ArrayList<Accounts> allAccounts = new ArrayList<>();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Accounts account = new Accounts();
                account.setEmail(rs.getString("Email")); 
                account.setFirstName(rs.getString("First_Name")); 
                account.setLastName(rs.getString("Last_name")); 
                account.setSex(rs.getString("User_sex")); 
                account.setPhone(rs.getString("Phone"));
                account.setRole(rs.getString("Role"));
                account.setAccountStatus(rs.getString("Account_status"));
                allAccounts.add(account);
            }
            rs.close();
            ps.close();
            return allAccounts;
        } catch (SQLException ex) {
            Logger.getLogger(AccountsDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public ArrayList<Accounts> searchByName(String searchString){
        try {
            String sql = "SELECT [Email],[First_Name],[Last_name],[User_sex],[Phone],[Role],[Account_status]\n"
                    + "FROM [dbo].[Account] WHERE [First_Name] LIKE ? OR [Last_name] LIKE ? OR ([First_Name] + ' ' + [Last_name]) LIKE ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + searchString + "%"); // Match first name
            ps.setString(2, "%" + searchString + "%"); // Match last name
            ps.setString(3, "%" + searchString + "%"); // Match first name + last name
            ResultSet rs = ps.executeQuery();
            ArrayList<Accounts> accountList = new ArrayList<>();
            while(rs.next()){
                Accounts account = new Accounts();
                account.setEmail(rs.getString("Email"));
                account.setFirstName(rs.getString("First_Name"));
                account.setLastName(rs.getString("Last_name"));
                account.setSex(rs.getString("User_sex"));
                account.setPhone(rs.getString("Phone"));
                account.setRole(rs.getString("Role"));
                account.setAccountStatus(rs.getString("Account_status"));
                accountList.add(account);
            }
            rs.close();
            ps.close();
            return accountList;
        } catch (SQLException ex) {
            Logger.getLogger(AccountsDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public Accounts searchByEmail(String email){
        try {
            String sql = "SELECT [Email],[First_Name],[Last_name],[User_sex],[Phone],[Role],[Account_status]\n"
                    + "FROM [dbo].[Account] WHERE [Email] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email.toLowerCase()); // Convert search string to lowercase for case-insensitive search
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Accounts account = new Accounts();
                account.setEmail(rs.getString("Email"));
                account.setFirstName(rs.getString("First_Name"));
                account.setLastName(rs.getString("Last_name"));
                account.setSex(rs.getString("User_sex"));
                account.setPhone(rs.getString("Phone"));
                account.setRole(rs.getString("Role"));
                account.setAccountStatus(rs.getString("Account_status"));
                rs.close();
                ps.close();
                return account;
                
            } else {
                // If no matching record found, return null
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountsDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    public void toggleUser(String status, String email){
        try {
            String sql="UPDATE [dbo].[Account]\n"
                    + "SET [Account_status] = ?\n"
                    + "WHERE [Email] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, email);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean checkRegisteredAccount(String email) {
        try {
            String sql = "SELECT [Email] FROM [dbo].[Account] WHERE [Email] LIKE ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            boolean result = rs.next(); // If there is a result, it means the email is registered
            // Close ResultSet and PreparedStatement
            rs.close();
            ps.close();
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(AccountsDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }


}
