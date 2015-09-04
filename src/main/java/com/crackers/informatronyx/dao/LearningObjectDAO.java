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
}