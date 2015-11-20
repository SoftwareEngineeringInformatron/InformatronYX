/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dao;

import com.crackers.informatronyx.models.LearningObjectReviewInformation;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Update;
import java.net.UnknownHostException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Andrew Paul Mago
 */
@Repository
public class LearningObjectReviewInformationDAO {
    @Autowired MongoOperations loriMongoOps;
    public  boolean addLORI(LearningObjectReviewInformation LORI) throws UnknownHostException {
         try {
         loriMongoOps.insert(LORI);
         return true;
        } catch (NullPointerException ae) {System.out.println(ae.getMessage()); return false;}
    }
    
    public  boolean editLORI(LearningObjectReviewInformation LORI) throws UnknownHostException {
        try {
         Update updateLORI = new Update();
         //updateLORI.set("id",LORI.getId());
         updateLORI.set("evaluation", LORI.getEvaluation());
         updateLORI.set("learningObjectId",LORI.getLearningObjectId());
         updateLORI.set("reviewId", LORI.getReviewId());
         updateLORI.set("subject", LORI.getSubject());
         loriMongoOps.findAndModify(query(where("subject").is(LORI.getSubject()).andOperator((where("learningObjectId").is(LORI.getLearningObjectId()).andOperator(where("reviewId").is(LORI.getReviewId()))))),updateLORI,LearningObjectReviewInformation.class);
         return true;
         
        } catch (NullPointerException ae) {System.out.println(ae.getMessage()); return false;}
    }
    
    public  boolean deleteLORI(LearningObjectReviewInformation LORI) throws UnknownHostException {
        try {
         
         loriMongoOps.remove(query(where("learningObjectId").is(LORI.getLearningObjectId()).andOperator(where("reviewId").is(LORI.getReviewId()))), LearningObjectReviewInformation.class);
         return true;
         
        } catch (NullPointerException ae) {System.out.println(ae.getMessage()); return false;}
    }
    
    public boolean exists(LearningObjectReviewInformation LORI) throws UnknownHostException {
        try {
         boolean exists = false;
         loriMongoOps.findOne(query(where("learningObjectId").is(LORI.getLearningObjectId()).andOperator(where("reviewId").is(LORI.getReviewId()))), LearningObjectReviewInformation.class);
         return exists;
         
        } catch (NullPointerException ae) {System.out.println(ae.getMessage()); return false;}
    }
    
    public  List<LearningObjectReviewInformation> getLORIs(LearningObjectReviewInformation LORI,String filter) throws UnknownHostException {
        try {
        
        if(filter.contentEquals("learningObjectId"))
        return loriMongoOps.find(query(where("learningObjectId").is(LORI.getLearningObjectId())), LearningObjectReviewInformation.class);
        else if(filter.contentEquals("both"))
        return loriMongoOps.find(query(where("learningObjectId").is(LORI.getLearningObjectId()).andOperator((where("reviewId").is(LORI.getReviewId())))), LearningObjectReviewInformation.class);   
        else if(filter.contentEquals("reviewId"))
        return loriMongoOps.find(query(where("reviewId").is(LORI.getReviewId())), LearningObjectReviewInformation.class);
        else
        return loriMongoOps.findAll(LearningObjectReviewInformation.class);
        
        } catch(NullPointerException ae) {System.out.println("DAO Error!"); return null;}
    }
    
    /*
    public static void main(String[] args) throws UnknownHostException {
        LearningObjectReviewInformation lori = new LearningObjectReviewInformation();
        LearningObjectReviewInformation lori2;
        lori.setEvaluation("WE WE WE");
        lori.setLearningObjectId("123");
        lori.setReviewId("321");
        lori.setSubject("math");
        System.out.println(LearningObjectReviewInformationDAO.addLORI(lori));
        lori2 = lori;
        lori2.setEvaluation("456");
        System.out.println(LearningObjectReviewInformationDAO.editLORI(lori));
        System.out.println(LearningObjectReviewInformationDAO.getLORIs(lori, "learningObjectId"));
        //System.out.println(LearningObjectReviewInformationDAO.deleteLORI(lori2));
        System.out.println(LearningObjectReviewInformationDAO.getLORIs(new LearningObjectReviewInformation(), "").toString());
    }
    */
    
}
