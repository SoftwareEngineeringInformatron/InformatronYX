/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dto;

import com.crackers.informatronyx.models.CreditTransaction;
import java.text.DateFormat;
import java.util.Date;

/**
 *
 * @author Ted Ian Osias
 */
public class CreditTransactionDto {
    
    private String id;
    private String u_ID = null;
    private String or = null;
    private float amnt = 0.0f;
    private Date dot = null;
    private String date = null;
    private boolean ok = false;
    private String appBy = null;
    
    public String getId() {
        return id;
        
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getU_ID() {
        return u_ID;
    }

    public void setU_ID(String u_ID) {
        this.u_ID = u_ID;
    }

    public String getOr() {
        return or;
    }

    public void setOr(String or) {
        this.or = or;
    }

    public float getAmnt() {
        return amnt;
    }

    public void setAmnt(float amnt) {
        this.amnt = amnt;
    }

    public Date getDot() {
        return dot;
    }

    public void setDot(Date dot) {
        this.dot = dot;
        this.date = DateFormat.getDateInstance(DateFormat.MEDIUM).format(dot);
    }

    public boolean isOk() {
        return ok;
    }

    public void setOk(boolean ok) {
        this.ok = ok;
    }
    
    public void setData(CreditTransaction model){
        id = model.getId();
        this.u_ID = model.getUser_Id();
        this.ok = model.isFinished();
        this.amnt = model.getAmount();
        this.setDot(model.getDateOfTransaction());
        this.or = model.getOfficialReceipt();
        this.appBy = model.getApproveBy();
    }

    public String getAppBy() {
        return appBy;
    }

    public void setAppBy(String appBy) {
        this.appBy = appBy;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
}
