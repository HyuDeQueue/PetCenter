/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validator;

/**
 *
 * @author Windows 10
 */
public class Validator {
    public String checkStringOptional(String msg){
        if(msg == null || msg.trim().isEmpty()) return "Không có";
        else return msg;
    }
}
