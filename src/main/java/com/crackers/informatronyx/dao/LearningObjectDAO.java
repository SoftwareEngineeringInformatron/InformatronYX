/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dao;

import com.crackers.informatronyx.models.LearningObject;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.mongodb.core.MongoOperations;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import org.springframework.data.mongodb.core.query.Query;
import static org.springframework.data.mongodb.core.query.Query.query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Nelson
 */
@Repository
public class LearningObjectDAO {
    
    @Autowired MongoOperations learningObjectMongoOps;
    
    
    public  List<LearningObject> getList() throws UnknownHostException {
       return learningObjectMongoOps.findAll(LearningObject.class);
    }
    
    public  boolean exists(String id) throws UnknownHostException {
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("id").is(id));
        ok = learningObjectMongoOps.exists(query, LearningObject.class);
        return ok;
    }
    
    public  List<LearningObject> getMostLikedList() throws UnknownHostException {
       
       Query query = new Query();
       //query.with(new Sort(Sort.Direction.DESC, "likes"));
       query.with(new Sort(new Order(Direction.DESC, "likes")));
       return learningObjectMongoOps.find(query, LearningObject.class);
    }
    
    public  List<LearningObject> getMostDownloadedList() throws UnknownHostException {
       Query query = new Query();
       query.with(new Sort(new Order(Direction.DESC, "downloads")));
       return learningObjectMongoOps.find(query, LearningObject.class);
    }
    
    //Clears the list then Adds the available LOs
    public  boolean updateList(LearningObject object) throws UnknownHostException {
        try {
         
         //Clear LO list
         //Add Available LOs         
         learningObjectMongoOps.insert(object);
         return true;         
        } 
        catch (NullPointerException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    public  void addLearningObject(LearningObject object) throws UnknownHostException {
         
         learningObjectMongoOps.insert(object);
    }
    
    public  void addLearningObjects(List<LearningObject> objects) throws UnknownHostException {
         
         learningObjectMongoOps.insert(objects);
    }
    
    public  List<LearningObject> getAllLearningObjectByDateUpload(Date date) throws UnknownHostException {
        
        return learningObjectMongoOps.find(query(where("uploadDate").is(date)), LearningObject.class);
    }
    
    
    //Tests
    
    public static void main(String[] args) throws Exception {
        LearningObject lo = new LearningObject();
        LearningObject lo2 = new LearningObject();
        LearningObject lo3 = new LearningObject();
        LearningObject lo4 = new LearningObject();
        
        lo.setLikes(111);
        lo.setDownloads(666);
        lo.setTitle("Nihingo");
        lo.setPrice(69.00f);
        lo.setDescription("We Nihingooooooo!");
        lo.setId("LO1");
        lo.setSubject("Japanese");
        lo.setUploadDate("12/11/2015");
        System.out.println(lo.getPrice());
        //LearningObjectDAO.addLearningObject(lo);
        
        lo2.setLikes(20);
        lo2.setDownloads(153);
        lo2.setTitle("Biboaf");
        lo2.setPrice(1.50f);
        lo2.setDescription("Cagot dribbles the ball.. WITH HIS HEAD!");
        lo2.setId("LO2");
        lo2.setSubject("Meikz City");
        lo2.setUploadDate("09/11/2000");
       // LearningObjectDAO.addLearningObject(lo2);
        
        lo3.setLikes(9);
        lo3.setDownloads(15);
        lo3.setTitle("Jjjownjii");
        lo3.setPrice(7.50f);
        lo3.setDescription("ULTRA KILL!!");
        lo3.setId("LO3");
        //LearningObjectDAO.addLearningObject(lo3);
        
        lo4.setLikes(50);
        lo4.setDownloads(73);
        lo4.setTitle("walksPerSecond");
        lo4.setId("LO4");
        //LearningObjectDAO.addLearningObject(lo4);
        
        //JOptionPane.showMessageDialog(null, LearningObjectDAO.getMostLikedList().toString());
       // JOptionPane.showMessageDialog(null, LearningObjectDAO.getMostDownloadedList().toString());
        //System.out.println(LearningObjectDAO.getMostLikedList());
    }

    public LearningObject getLearningObjectById(String id) {
        Query query = new Query();
        query.addCriteria(where("id").is(id));
        return learningObjectMongoOps.findOne(query, LearningObject.class);
    }
    
    public boolean clearCollection(){
        try{
        learningObjectMongoOps.dropCollection(LearningObject.class);
        return true;
        }catch(Exception e){
            return false;
        }
    }
    
}