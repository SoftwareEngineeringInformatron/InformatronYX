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
public class DownloadRecord {
    
    @Id
    String id;
    String userId = null;
    String learningObjectId = null;
    Date dateDownload = null;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getLearningObjectId() {
        return learningObjectId;
    }

    public void setLearningObjectId(String learningObjectId) {
        this.learningObjectId = learningObjectId;
    }

    public Date getDateDownload() {
        return dateDownload;
    }

    public void setDateDownload(Date dateDownload) {
        this.dateDownload = dateDownload;
    }
    
    
}
