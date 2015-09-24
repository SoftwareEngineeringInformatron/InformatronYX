/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dto;

import com.crackers.informatronyx.models.LearningObjectTransaction;
import com.crackers.informatronyx.models.Transaction;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ted Ian Osias
 */
public class LOTransactionDto extends Transaction{
    
    private String lo_id;
    private String u_Id;
    private List<String> errorList = new ArrayList<>();

    public String getLo_id() {
        return lo_id;
    }

    public void setLo_id(String lo_id) {
        this.lo_id = lo_id;
    }

    public String getU_Id() {
        return u_Id;
    }

    public void setU_Id(String u_Id) {
        this.u_Id = u_Id;
    }

    public List<String> getErrorList() {
        return errorList;
    }

    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }

    public void setData(LearningObjectTransaction transaction) {
        this.setId(transaction.getId());
        this.setU_Id(transaction.getUser_id());
        this.setLo_id(transaction.getLearningObjectId());
        this.setAmount(transaction.getAmount());
        this.setDateOfTransaction(transaction.getDateOfTransaction());
        this.setFinished(transaction.isFinished());
        this.setOfficialReceipt(transaction.getOfficialReceipt());
    }
    
    
    
}
