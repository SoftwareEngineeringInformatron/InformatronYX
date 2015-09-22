/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.services;

import com.crackers.informatronyx.dao.LearningObjectReviewInformationDAO;
import com.crackers.informatronyx.models.LearningObjectReviewInformation;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class LearningObjectReviewInformationService {
    
    public boolean submitReview(LearningObjectReviewInformation LORI) throws UnknownHostException {
        if(evaluate(LORI)) {
            LearningObjectReviewInformation loriModel = new LearningObjectReviewInformation();
            loriModel.setEvaluation(LORI.getEvaluation());
            loriModel.setId(LORI.getId());
            loriModel.setLearningObjectId(LORI.getLearningObjectId());
            loriModel.setReviewId(LORI.getReviewId());
            loriModel.setSubject(LORI.getSubject());
            LearningObjectReviewInformationDAO.addLORI(loriModel);
            return true;
            } else
                return false;
    }
    
    public boolean editReview(LearningObjectReviewInformation LORI) throws UnknownHostException {
        if(evaluate(LORI)) {
            LearningObjectReviewInformation loriModel = new LearningObjectReviewInformation();
            loriModel.setEvaluation(LORI.getEvaluation());
            loriModel.setId(LORI.getId());
            loriModel.setLearningObjectId(LORI.getLearningObjectId());
            loriModel.setReviewId(LORI.getReviewId());
            loriModel.setSubject(LORI.getSubject());
            LearningObjectReviewInformationDAO.editLORI(loriModel);
            return true;
            } else
                return false;
    }
    
    public boolean deleteReview(LearningObjectReviewInformation LORI) throws UnknownHostException {
        if(evaluate(LORI)) {
            LearningObjectReviewInformation loriModel = new LearningObjectReviewInformation();
            loriModel.setEvaluation(LORI.getEvaluation());
            loriModel.setId(LORI.getId());
            loriModel.setLearningObjectId(LORI.getLearningObjectId());
            loriModel.setReviewId(LORI.getReviewId());
            loriModel.setSubject(LORI.getSubject());
            LearningObjectReviewInformationDAO.deleteLORI(loriModel);
            return true;
            } else
                return false;
    }
    
    public List<LearningObjectReviewInformation> getQuizResults(LearningObjectReviewInformation LORI, String condition) throws UnknownHostException {
        List<LearningObjectReviewInformation> LearningObjectReviewInformationResults = new ArrayList<LearningObjectReviewInformation>();
        try {
            LearningObjectReviewInformation loriModel = new LearningObjectReviewInformation();
            if(condition.isEmpty()) {
                LearningObjectReviewInformationResults = LearningObjectReviewInformationDAO.getLORIs(loriModel, "");
                //System.out.println(quiz.getQuizResults().get(0).getLo_name());
            } else {
                loriModel.setEvaluation(LORI.getEvaluation());
            loriModel.setId(LORI.getId());
            loriModel.setLearningObjectId(LORI.getLearningObjectId());
            loriModel.setReviewId(LORI.getReviewId());
            loriModel.setSubject(LORI.getSubject());
            if(condition.contentEquals("learningObjectId"))
                LearningObjectReviewInformationResults = LearningObjectReviewInformationDAO.getLORIs(loriModel, "learningObjectId");
            else if(condition.contentEquals("reviewId"))
                LearningObjectReviewInformationResults = LearningObjectReviewInformationDAO.getLORIs(loriModel, "reviewId");
            else if(condition.contentEquals("both"))
                LearningObjectReviewInformationResults = LearningObjectReviewInformationDAO.getLORIs(loriModel, "both");
            else
                return null;
            }
            
        } catch(NullPointerException ae) {System.out.println("Service Error!"); ae.printStackTrace();}
         finally{return LearningObjectReviewInformationResults;}
    }
    
    private boolean evaluate(LearningObjectReviewInformation LORI) {
        return true;
    }
}
