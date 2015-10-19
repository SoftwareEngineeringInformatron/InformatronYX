/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.models;

/**
 *
 * @author Ted Ian Osias
 */

public class CreditTransaction extends Transaction{
    
    private String user_Id = null;
    private String byUser = null;
    private boolean declined;
    

    public String getByUser() {
        return byUser;
    }

    public boolean isDeclined() {
        return declined;
    }

    public void setDeclined(boolean declined) {
        this.declined = declined;
    }

    public void setByUser(String approveBy) {
        this.byUser = approveBy;
    }

    public String getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(String user_Id) {
        this.user_Id = user_Id;
    }
}
