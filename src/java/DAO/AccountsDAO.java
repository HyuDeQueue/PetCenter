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
}
