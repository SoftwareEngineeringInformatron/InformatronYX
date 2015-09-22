/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.models;

import org.springframework.data.annotation.Id;

/**
 *
 * @author Ted Ian Osias
 */
public class LearningObjectReviewInformation {
    @Id
    String id;
    String evaluation = null;
    String reviewId = null;
    String learningObjectId = null;
    String subject = null;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(String evaluation) {
        this.evaluation = evaluation;
    }

    public String getReviewId() {
        return reviewId;
    }

    public void setReviewId(String reviewId) {
        this.reviewId = reviewId;
    }

    public String getLearningObjectId() {
        return learningObjectId;
    }

    public void setLearningObjectId(String learningObjectId) {
        this.learningObjectId = learningObjectId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
    
    
}
