/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dao;

import com.crackers.informatronyx.config.DatabaseManager;
import com.crackers.informatronyx.models.LearningObjectReviewInformation;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Update;
import java.net.UnknownHostException;
import java.util.List;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;

/**
 *
 * @author Andrew Paul Mago
 */
public class LearningObjectReviewInformationDAO {
    
    public static boolean addLORI(LearningObjectReviewInformation LORI) throws UnknownHostException {
         try {
         MongoOperations mongoOps = DatabaseManager.getMongoOpsInstance("lori");
         mongoOps.insert(LORI);
         return true;
         
        } catch (NullPointerException ae) {System.out.println(ae.getMessage()); return false;}
    }
    
    public static boolean editLORI(LearningObjectReviewInformation LORI) throws UnknownHostException {
        try {
         MongoOperations mongoOps = DatabaseManager.getMongoOpsInstance("lori");
         Update updateLORI = new Update();
         //updateLORI.set("id",LORI.getId());
         updateLORI.set("evaluation", LORI.getEvaluation());
         updateLORI.set("learningObjectId",LORI.getLearningObjectId());
         updateLORI.set("reviewId", LORI.getReviewId());
         updateLORI.set("subject", LORI.getSubject());
         mongoOps.findAndModify(query(where("subject").is(LORI.getSubject()).andOperator((where("learningObjectId").is(LORI.getLearningObjectId()).andOperator(where("reviewId").is(LORI.getReviewId()))))),updateLORI,LearningObjectReviewInformation.class);
         return true;
         
        } catch (NullPointerException ae) {System.out.println(ae.getMessage()); return false;}
    }
    
    public static boolean deleteLORI(LearningObjectReviewInformation LORI) throws UnknownHostException {
        try {
         MongoOperations mongoOps = DatabaseManager.getMongoOpsInstance("lori");
         mongoOps.remove(query(where("learningObjectId").is(LORI.getLearningObjectId()).andOperator(where("reviewId").is(LORI.getReviewId()))), LearningObjectReviewInformation.class);
         return true;
         
        } catch (NullPointerException ae) {System.out.println(ae.getMessage()); return false;}
    }
    
    public static List<LearningObjectReviewInformation> getLORIs(LearningObjectReviewInformation LORI,String filter) throws UnknownHostException {
        try {
        MongoOperations mongoOps = DatabaseManager.getMongoOpsInstance("lori");
        if(filter.contentEquals("learningObjectId"))
        return mongoOps.find(query(where("learningObjectId").is(LORI.getLearningObjectId())), LearningObjectReviewInformation.class);
        else if(filter.contentEquals("both"))
        return mongoOps.find(query(where("learningObjectId").is(LORI.getLearningObjectId()).andOperator((where("reviewId").is(LORI.getReviewId())))), LearningObjectReviewInformation.class);   
        else if(filter.contentEquals("reviewId"))
        return mongoOps.find(query(where("reviewId").is(LORI.getReviewId())), LearningObjectReviewInformation.class);
        else
        return mongoOps.findAll(LearningObjectReviewInformation.class);
        
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
