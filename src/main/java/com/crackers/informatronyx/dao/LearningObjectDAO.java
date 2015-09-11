/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dao;

import com.crackers.informatronyx.config.AppConfig;
import com.crackers.informatronyx.models.LearningObject;
import com.crackers.informatronyx.models.User;
import com.mongodb.Mongo;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.List;
import javax.swing.JOptionPane;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import org.springframework.data.mongodb.core.query.Query;
import static org.springframework.data.mongodb.core.query.Query.query;

/**
 *
 * @author Nelson
 */
public class LearningObjectDAO {
    
    public static List<LearningObject> getList() throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"database");
        return mongoOps.findAll(LearningObject.class);
    }
    
    public static boolean exists(String id) throws UnknownHostException {
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port), "database");
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("id").is(id));
        ok = mongoOps.exists(query, LearningObject.class);
        return ok;
    }
    
    public static List<LearningObject> getMostLikedList() throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"database");
       Query query = new Query();
       //query.with(new Sort(Sort.Direction.DESC, "likes"));
       query.with(new Sort(new Order(Direction.DESC, "likes")));
       return mongoOps.find(query, LearningObject.class);
    }
    
    public static List<LearningObject> getMostDownloadedList() throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"database");
       Query query = new Query();
       query.with(new Sort(new Order(Direction.DESC, "downloads")));
       return mongoOps.find(query, LearningObject.class);
    }
    
    //Clears the list then Adds the available LOs
    public static boolean updateList(LearningObject object) throws UnknownHostException {
        try {
         MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"database");
         //Clear LO list
         //Add Available LOs         
         mongoOps.insert(object);
         return true;         
        } 
        catch (NullPointerException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    public static void addLearningObject(LearningObject object) throws UnknownHostException {
         MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"database");
         mongoOps.insert(object);
    }
    
    public static void addLearningObjects(List<LearningObject> objects) throws UnknownHostException {
         MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"database");
         mongoOps.insert(objects);
    }
    
    public static List<LearningObject> getAllLearningObjectByDateUpload(Date date) throws UnknownHostException {
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"database");
        return mongoOps.find(query(where("uploadDate").is(date)), LearningObject.class);
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
        LearningObjectDAO.addLearningObject(lo);
        
        lo2.setLikes(20);
        lo2.setDownloads(153);
        lo2.setTitle("Biboaf");
        LearningObjectDAO.addLearningObject(lo2);
        
        lo3.setLikes(9);
        lo3.setDownloads(15);
        lo3.setTitle("Jjjownjii");
        LearningObjectDAO.addLearningObject(lo3);
        
        lo4.setLikes(50);
        lo4.setDownloads(73);
        lo4.setTitle("walksPerSecond");
        LearningObjectDAO.addLearningObject(lo4);
        
        //JOptionPane.showMessageDialog(null, LearningObjectDAO.getMostLikedList().toString());
        JOptionPane.showMessageDialog(null, LearningObjectDAO.getMostDownloadedList().toString());
        //System.out.println(LearningObjectDAO.getMostLikedList());
    }
    
}