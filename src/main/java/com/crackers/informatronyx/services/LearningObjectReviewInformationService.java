/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.services;

import com.crackers.informatronyx.dao.LearningObjectReviewInformationDAO;
import com.crackers.informatronyx.dto.LearningObjectReviewInformationDto;
import com.crackers.informatronyx.models.LearningObjectReviewInformation;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Andrew Paul Mago
 */
public class LearningObjectReviewInformationService {
    
    public boolean submitReview(LearningObjectReviewInformationDto LORI) throws UnknownHostException {
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
    
    public boolean editReview(LearningObjectReviewInformationDto LORI) throws UnknownHostException {
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
    
    public boolean deleteReview(LearningObjectReviewInformationDto LORI) throws UnknownHostException {
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
    
    public List<LearningObjectReviewInformationDto> getQuizResults(LearningObjectReviewInformationDto LORI, String condition) throws UnknownHostException {
        List<LearningObjectReviewInformationDto> LearningObjectReviewInformationResults = new ArrayList<LearningObjectReviewInformationDto>();
        try {
            LearningObjectReviewInformation loriModel = new LearningObjectReviewInformation();
            if(condition.isEmpty()) {
                LORI.setLORIs(LearningObjectReviewInformationDAO.getLORIs(loriModel, ""));
                //System.out.println(quiz.getQuizResults().get(0).getLo_name());
            } else {
                loriModel.setEvaluation(LORI.getEvaluation());
            loriModel.setId(LORI.getId());
            loriModel.setLearningObjectId(LORI.getLearningObjectId());
            loriModel.setReviewId(LORI.getReviewId());
            loriModel.setSubject(LORI.getSubject());
            if(condition.contentEquals("learningObjectId"))
                LORI.setLORIs(LearningObjectReviewInformationDAO.getLORIs(loriModel, "learningObjectId"));
            else if(condition.contentEquals("reviewId"))
                LORI.setLORIs(LearningObjectReviewInformationDAO.getLORIs(loriModel, "reviewId"));
            else if(condition.contentEquals("both"))
                LORI.setLORIs(LearningObjectReviewInformationDAO.getLORIs(loriModel, "both"));
            else
                return null;
            }
            
            for(int i = 0; i < LORI.getLORIs().size(); i++)
                LearningObjectReviewInformationResults.add(LORI.getsetLORI(LORI.getLORIs().get(i)));
            
        } catch(NullPointerException ae) {System.out.println("Service Error!"); ae.printStackTrace();}
         finally{return LearningObjectReviewInformationResults;}
    }
    
    private boolean evaluate(LearningObjectReviewInformationDto LORI) {
        return true;
    }
}
