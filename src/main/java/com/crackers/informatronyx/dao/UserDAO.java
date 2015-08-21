/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dao;

import com.crackers.informatronyx.config.AppConfig;
import com.crackers.informatronyx.models.User;
import com.mongodb.Mongo;
import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
    
    
    public static User getUser(User user) throws UnknownHostException{ 
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"database");
        User p = null;
        p = mongoOps.findOne(query(where("id").is(user.getId()).orOperator(where("username").is(user.getUsername()))), User.class);
        return p;
    }
    public static boolean addUser(User user) throws UnknownHostException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"database");
        boolean ok = false;
        mongoOps.insert(user);
        ok = true;
        return ok;
    }
    public static boolean editUser(User user) throws UnknownHostException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"database");
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("id").is(user.getId()));
        Update update = new Update();
        update.addToSet("username", user.getUsername());
        update.addToSet("password", user.getPassword());
        mongoOps.updateFirst(query,update,User.class);
        ok = true;
        return ok;
    }
    public static boolean deleteUser(User user) throws UnknownHostException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"database");
        boolean ok = false;
        mongoOps.remove(user);
        ok = true;
        return ok;
    }
    public static void main(String []args){
        try {
            User user = new User("osiastedian","osias.tedian");
           // System.out.println(UserDAO.addUser(user));
            //user = UserDAO.getUser(user);
            //UserDAO.deleteUser(user);
            // EXIST//
            System.out.println("Chuya"+UserDAO.getUser(user));//UserDAO.exists("osiastedian"));
        } catch (UnknownHostException ex) {
            
        }
    }
    public static boolean exists(String username) throws UnknownHostException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"database");
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("username").is(username));
        ok = mongoOps.exists(query, User.class);
        return ok;
    }
}
