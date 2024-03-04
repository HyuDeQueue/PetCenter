/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validator;

import DAO.AccountsDAO;
import DAO.PetDAO;
import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author Windows 10
 */
public class Validator {
    public String checkStringOptional(String msg){
        if(msg == null || msg.trim().isEmpty()) return "Không khai báo";
        else return msg;
    }
    
    public boolean checkValidDate(Date checkDate){
        Date nowDate = Date.valueOf(LocalDate.now());
        if(checkDate.before(nowDate)) return false;
        else return true;
    }
    
    public boolean checkValidCheckoutDate(Date checkinDate, Date checkoutDate){
        if(!checkValidDate(checkinDate)) return false;
        else if(!checkValidDate(checkoutDate)) return false;
        else if(checkinDate.after(checkoutDate)) return false;
        else return true;
    }
    
    public boolean checkIfRegistered(String email){
        AccountsDAO accountsDAO = new AccountsDAO();
        return accountsDAO.checkRegisteredAccount(email);
    }
    
    public boolean checkIfUserAlreadyHasThisPet(String petName, String email){
        PetDAO petDAO = new PetDAO();
        return petDAO.checkSamePetSameMail(petName, email);
    }
}
