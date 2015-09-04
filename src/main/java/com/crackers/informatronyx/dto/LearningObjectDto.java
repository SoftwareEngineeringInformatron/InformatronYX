/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dto;

import com.crackers.informatronyx.models.LearningElement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nelson
 */
public class LearningObjectDto {
    private String id;
    private String title;
    private String subject;
    private String description;
    private int downloads;
    private String uploadDate;
    private int likes;
    private List<LearningElement> sequence;
    private float price;
    List<String> errorList;
    
    public LearningObjectDto() {
        errorList = new ArrayList<String>();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDownloads() {
        return downloads;
    }

    public void setDownloads(int downloads) {
        this.downloads = downloads;
    }

    public String getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(String uploadDate) {
        this.uploadDate = uploadDate;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public List<LearningElement> getSequence() {
        return sequence;
    }

    public void setSequence(List<LearningElement> sequence) {
        this.sequence = sequence;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public List<String> getErrorList() {
        return errorList;
    }

    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }
    
    
}
