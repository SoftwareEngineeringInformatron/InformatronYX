/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.models;

import java.util.List;
import org.springframework.data.annotation.Id;

/**
 *
 * @author Ted Ian Osias
 */
public class LearningObjectReviewInformation {
    @Id
    String id;
    List<String> evaluation = null;
    String reviewerId = null;
    String learningObjectId = null;
    String subject = null;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<String> getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(List<String> evaluation) {
        this.evaluation = evaluation;
    }

    public String getReviewId() {
        return reviewerId;
    }

    public void setReviewId(String reviewId) {
        this.reviewerId = reviewId;
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
