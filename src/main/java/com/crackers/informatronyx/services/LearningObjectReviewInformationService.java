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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Andrew Paul Mago
 */
@Service 
public class LearningObjectReviewInformationService {
    @Autowired LearningObjectReviewInformationDAO dao;
    
    public boolean submitReview(LearningObjectReviewInformationDto LORI) throws UnknownHostException {
        if(evaluate(LORI)) {
            LearningObjectReviewInformation loriModel = new LearningObjectReviewInformation();
            loriModel.setEvaluation(LORI.getEvaluation());
            loriModel.setId(LORI.getId());
            loriModel.setLearningObjectId(LORI.getLearningObjectId());
            loriModel.setReviewId(LORI.getReviewId());
            loriModel.setSubject(LORI.getSubject());
            dao.addLORI(loriModel);
            return true;
            } else
                return false;
    }
    
    public boolean editReview(LearningObjectReviewInformationDto LORI) throws UnknownHostException {
        if(evaluate(LORI)) {
            LearningObjectReviewInformation loriModel = new LearningObjectReviewInformation();
            loriModel.setEvaluation(LORI.getEvaluation());
            //loriModel.setId(LORI.getId());
            loriModel.setLearningObjectId(LORI.getLearningObjectId());
            loriModel.setReviewId(LORI.getReviewId());
            loriModel.setSubject(LORI.getSubject());
            dao.editLORI(loriModel);
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
            dao.deleteLORI(loriModel);
            return true;
            } else
                return false;
    }
    
    public List<LearningObjectReviewInformationDto> getLORIs(LearningObjectReviewInformationDto LORI, String condition) throws UnknownHostException {
        List<LearningObjectReviewInformationDto> LearningObjectReviewInformationResults = new ArrayList<LearningObjectReviewInformationDto>();
        try {
            LearningObjectReviewInformation loriModel = new LearningObjectReviewInformation();
            if(condition.isEmpty()) {
                LORI.setLORIs(dao.getLORIs(loriModel, ""));
            } else {
            loriModel.setEvaluation(LORI.getEvaluation());
            loriModel.setId(LORI.getId());
            loriModel.setLearningObjectId(LORI.getLearningObjectId());
            loriModel.setReviewId(LORI.getReviewId());
            loriModel.setSubject(LORI.getSubject());
            if(condition.contentEquals("learningObjectId"))
                LORI.setLORIs(dao.getLORIs(loriModel, "learningObjectId"));
            else if(condition.contentEquals("reviewId"))
                LORI.setLORIs(dao.getLORIs(loriModel, "reviewId"));
            else if(condition.contentEquals("both"))
                LORI.setLORIs(dao.getLORIs(loriModel, "both"));
            else
                return null;
            }
            
            LearningObjectReviewInformationDto loridto;
            for(int i = 0; i < LORI.getLORIs().size(); i++) {
                loridto = new LearningObjectReviewInformationDto();
                loridto.getsetLORI(LORI.getLORIs().get(i));
                LearningObjectReviewInformationResults.add(loridto);
            }
        } catch(NullPointerException ae) {System.out.println("Service Error!"); ae.printStackTrace();} 
        return LearningObjectReviewInformationResults;
    }
    
    private boolean evaluate(LearningObjectReviewInformationDto LORI) {
        return true;
    }
}
