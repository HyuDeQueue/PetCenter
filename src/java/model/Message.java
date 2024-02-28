/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Windows 10
 */
public class Message implements Serializable{
    private int MessageId;
    private String Message;
    private Date MessageDate;
    private int DetailId;

    public Message() {
    }

    public Message(int MessageId, String Message, Date MessageDate, int DetailId) {
        this.MessageId = MessageId;
        this.Message = Message;
        this.MessageDate = MessageDate;
        this.DetailId = DetailId;
    }

    public Message(String Message, Date MessageDate, int DetailId) {
        this.Message = Message;
        this.MessageDate = MessageDate;
        this.DetailId = DetailId;
    }

    public int getMessageId() {
        return MessageId;
    }

    public void setMessageId(int MessageId) {
        this.MessageId = MessageId;
    }

    public String getMessage() {
        return Message;
    }

    public void setMessage(String Message) {
        this.Message = Message;
    }

    public Date getMessageDate() {
        return MessageDate;
    }

    public void setMessageDate(Date MessageDate) {
        this.MessageDate = MessageDate;
    }

    public int getDetailId() {
        return DetailId;
    }

    public void setDetailId(int DetailId) {
        this.DetailId = DetailId;
    }
    
    
    
}
