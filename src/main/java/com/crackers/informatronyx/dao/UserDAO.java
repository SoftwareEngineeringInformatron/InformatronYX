/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dao;

import com.crackers.informatronyx.config.AppConfig;
import com.crackers.informatronyx.config.DatabaseManager;
import com.crackers.informatronyx.models.User;
import com.mongodb.Mongo;
import java.net.UnknownHostException;
import java.util.List;

import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import org.springframework.data.mongodb.core.query.Query;
import static org.springframework.data.mongodb.core.query.Query.query;
import org.springframework.data.mongodb.core.query.Update;
/**
 *
 * @author Ted Ian Osias
 */
public class UserDAO {
    
    
    public static User getUser(String id) throws UnknownHostException{ 
        User p = null;
        p = DatabaseManager.getMongoOpsInstance("database").findOne(query(where("id").is(id)), User.class);
        return p;
    }
    public static List<User> getUserByPropertyAndValue(String property,Object value) throws UnknownHostException{ 
        return DatabaseManager.getMongoOpsInstance("database").find(query(where(property).is(value)), User.class);
    }
    public static boolean addUser(User user) throws UnknownHostException{
        MongoOperations mongoOps = DatabaseManager.getMongoOpsInstance("database");
        boolean ok = false;
        mongoOps.insert(user);
        ok = true;
        return ok;
    }
    public static boolean editUser(User user) throws UnknownHostException{
        boolean ok = false;
        
        /*
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"database");
        Query query = new Query();
        query.addCriteria(where("id").is(user.getId()));
        Update update = new Update();
        //update.addToSet("username",user.getUsername());
        update.addToSet("password", user.getPassword());
        update.addToSet("firstName","Testing rani");
        
        update.addToSet("lastName",user.getLastName());
        update.addToSet("approved",user.isApproved());
        update.addToSet("blocked",user.isBlocked());
        update.addToSet("functionType", user.getFunctionType());
        
        System.out.println(mongoOps.updateFirst(query,update,User.class).toString());*/
        DatabaseManager.getMongoOpsInstance("database").save(user);
        ok = true;
        return ok;
    }
    public static boolean saveUser(User user) throws UnknownHostException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"database");
        boolean ok = false;
        mongoOps.save(user);
        return ok;
    }
    public static boolean deleteUser(User user) throws UnknownHostException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"database");
        boolean ok = false;
        mongoOps.remove(user);
        ok = true;
        return ok;
    }
    public static boolean exists(String username) throws UnknownHostException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"database");
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("username").is(username));
        ok = mongoOps.exists(query, User.class);
        return ok;
    }
    public static User getUser(String username,String password) throws UnknownHostException{
        Query query = new Query();
        query.addCriteria(where("username").is(username).andOperator(where("password").is(password)));
        return DatabaseManager.getMongoOpsInstance("database").findOne(query, User.class);
    }
    public static List<User> getAllUserOfType(String type){return null;}

    public static List<User> getAllUsers() throws UnknownHostException {
        return DatabaseManager.getMongoOpsInstance("database").findAll(User.class);
    }
}
