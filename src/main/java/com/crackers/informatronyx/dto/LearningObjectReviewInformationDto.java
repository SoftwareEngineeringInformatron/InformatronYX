/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dto;

import com.crackers.informatronyx.models.LearningObjectReviewInformation;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Andrew Paul Mago
 */
public class LearningObjectReviewInformationDto {
    String id;
    List<String> evaluation = null;
    String reviewerId = null;
    String learningObjectId = null;
    String subject = null;
    List<LearningObjectReviewInformation> LORIs;
    List<String> errorList;

    public LearningObjectReviewInformationDto() {
        errorList = new ArrayList();
    }

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

    public List<LearningObjectReviewInformation> getLORIs() {
        return LORIs;
    }

    public void setLORIs(List<LearningObjectReviewInformation> LORIs) {
        this.LORIs = LORIs;
    }

    public List<String> getErrorList() {
        return errorList;
    }

    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }
    
    public LearningObjectReviewInformationDto getsetLORI(LearningObjectReviewInformation LORI) {
        this.setEvaluation(LORI.getEvaluation());
        this.setId(LORI.getId());
        this.setLearningObjectId(LORI.getLearningObjectId());
        this.setReviewId(LORI.getReviewId());
        this.setSubject(LORI.getSubject());
        return this;
    }
    
    
}
