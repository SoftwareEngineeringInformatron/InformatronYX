/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.models;

import java.util.List;
/**
 *
 * @author Nelson
 */
public class LearningObject {
    private String id;
    private String title;
    private String subject;
    private String description;
    private int downloads;
    private String uploadDate;
    private int likes;
    private List<LearningElement> sequence;
    private float price;

    public void setId(String id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setDownloads(int downloads) {
        this.downloads = downloads;
    }

    public void setUploadDate(String uploadDate) {
        this.uploadDate = uploadDate;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public void setSequence(List<LearningElement> sequence) {
        this.sequence = sequence;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getSubject() {
        return subject;
    }

    public String getDescription() {
        return description;
    }

    public int getDownloads() {
        return downloads;
    }

    public String getUploadDate() {
        return uploadDate;
    }

    public int getLikes() {
        return likes;
    }

    public List<LearningElement> getSequence() {
        return sequence;
    }

    public float getPrice() {
        return price;
    }

    public LearningObject() {
    }
    
    
}
