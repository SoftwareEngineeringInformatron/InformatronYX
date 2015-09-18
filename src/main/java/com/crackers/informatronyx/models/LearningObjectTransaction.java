/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.models;

import java.util.Date;
import org.springframework.data.annotation.Id;

/**
 *
 * @author Ted Ian Osias
 */
public class LearningObjectTransaction {
    @Id
    String id;
    String learningObjectId = "";
    String user_id = "";
    float amount = 0.0f;
    boolean finished = false;
    Date dateOfTransaction = null;
    String officialReceipt = "";

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLearningObjectId() {
        return learningObjectId;
    }

    public void setLearningObjectId(String learningObjectId) {
        this.learningObjectId = learningObjectId;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public boolean isFinished() {
        return finished;
    }

    public void setFinished(boolean finished) {
        this.finished = finished;
    }

    public Date getDateOfTransaction() {
        return dateOfTransaction;
    }

    public void setDateOfTransaction(Date dateOfTransaction) {
        this.dateOfTransaction = dateOfTransaction;
    }

    public String getOfficialReceipt() {
        return officialReceipt;
    }

    public void setOfficialReceipt(String officialReceipt) {
        this.officialReceipt = officialReceipt;
    }
    
    
}
