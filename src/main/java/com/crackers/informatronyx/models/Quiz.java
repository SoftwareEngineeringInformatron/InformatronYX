/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.models;

import java.util.Date;

/**
 *
 * @author Andrew Paul Mago
 */
public class Quiz {
    
    int result;
    String learningObjectTitle;
    String username;
    Date startTime;
    Date endTime;

    public Quiz() {
    }
    

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String getLOtitle() {
        return learningObjectTitle;
    }

    public void setLOtitle(String LOtitle) {
        this.learningObjectTitle = LOtitle;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
    
    @Override
    public String toString() {
        return "\nLOtitle: " + this.learningObjectTitle + "\nUsername: " + this.username + "\nResult: " + this.result + "\nStart Time: " + this.startTime + "\nEnd Time: " + this.endTime;
    }
    
}
