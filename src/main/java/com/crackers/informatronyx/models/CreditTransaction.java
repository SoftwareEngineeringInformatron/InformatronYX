/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.models;

import java.util.Date;
import java.util.Objects;
import org.springframework.data.annotation.Id;

/**
 *
 * @author Ted Ian Osias
 */
public class CreditTransaction {
    @Id
    String transactionID;
    String userID = null;
    String officialReceipt = null;
    float amount = 0.0f;
    Date dateOfTransaction = null;
    boolean finished = false;

    public String getTransactionID() {
        return transactionID;
    }

    public void setTransactionID(String transactionID) {
        this.transactionID = transactionID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getOfficialReceipt() {
        return officialReceipt;
    }

    public void setOfficialReceipt(String officialReceipt) {
        this.officialReceipt = officialReceipt;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public Date getDateOfTransaction() {
        return dateOfTransaction;
    }

    public void setDateOfTransaction(Date dateOfTransaction) {
        this.dateOfTransaction = dateOfTransaction;
    }

    public boolean isFinished() {
        return finished;
    }

    public void setFinished(boolean finished) {
        this.finished = finished;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final CreditTransaction other = (CreditTransaction) obj;
        if (!Objects.equals(this.transactionID, other.transactionID)) {
            return false;
        }
        if (!Objects.equals(this.userID, other.userID)) {
            return false;
        }
        if (!Objects.equals(this.officialReceipt, other.officialReceipt)) {
            return false;
        }
        return true;
    }
    
}
