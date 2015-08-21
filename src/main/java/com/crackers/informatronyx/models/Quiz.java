/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.models;

/**
 *
 * @author User
 */
public class Quiz {
    
    int result;
    String LOtitle;
    String username;

    public Quiz() {
    }
    

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String getLOtitle() {
        return LOtitle;
    }

    public void setLOtitle(String LOtitle) {
        this.LOtitle = LOtitle;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
}
