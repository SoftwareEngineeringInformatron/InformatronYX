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
public abstract class Transaction {
    @Id
    private String id;
    private float amount;
    private String officialReceipt;
    private boolean finished;
    private Date dateOfTransaction = null;

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public String getOfficialReceipt() {
        return officialReceipt;
    }

    public void setOfficialReceipt(String officialReceipt) {
        this.officialReceipt = officialReceipt;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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
    
    
}
