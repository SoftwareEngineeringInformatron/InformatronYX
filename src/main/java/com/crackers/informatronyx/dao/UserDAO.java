/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dao;

import com.crackers.informatronyx.config.DatabaseManager;
import com.crackers.informatronyx.models.User;
import com.mongodb.Mongo;
import java.net.UnknownHostException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoOperations;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import org.springframework.data.mongodb.core.query.Query;
import static org.springframework.data.mongodb.core.query.Query.query;
import org.springframework.stereotype.Repository;
/**
 *
 * @author Ted Ian Osias
 */
@Repository
public class UserDAO {
    @Autowired MongoOperations userMongoOps;
    
    public  User getUser(String id) throws UnknownHostException{ 
        User p = null;
        
        p = userMongoOps.findOne(query(where("id").is(id)), User.class);
        return p;
    }
    public  List<User> getUserByPropertyAndValue(String property,Object value) throws UnknownHostException{ 
        return userMongoOps.find(query(where(property).is(value)), User.class);
    }
    public  boolean addUser(User user) throws UnknownHostException{
        MongoOperations mongoOps = userMongoOps;
        boolean ok = false;
        mongoOps.insert(user);
        ok = true;
        return ok;
    }
    public  boolean editUser(User user) throws UnknownHostException{
        boolean ok = false;
        userMongoOps.save(user);
        ok = true;
        return ok;
    }
    public  boolean saveUser(User user) throws UnknownHostException{
        MongoOperations mongoOps = userMongoOps;
        boolean ok = false;
        mongoOps.save(user);
        return ok;
    }
    public  boolean deleteUser(User user) throws UnknownHostException{
        MongoOperations mongoOps =userMongoOps;
        boolean ok = false;
        mongoOps.remove(this.getUser(user.getId()));
        ok = true;
        return ok;
    }
    public  boolean exists(String username) throws UnknownHostException{
        MongoOperations mongoOps = userMongoOps;
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("username").is(username));
        ok = mongoOps.exists(query, User.class);
        return ok;
    }
    public  User getUser(String username,String password) throws UnknownHostException{
        Query query = new Query();
        query.addCriteria(where("username").is(username).andOperator(where("password").is(password)));
        return userMongoOps.findOne(query, User.class);
    }
    public  List<User> getAllUserOfType(String type) throws UnknownHostException{
        Query query = new Query();
        Sort sort = new Sort(Sort.Direction.ASC,"functionType","username");
        query.addCriteria(where("userType").is(type)).with(sort);
        return userMongoOps. find(query, User.class);
    
    }

    public  List<User> getAllUsers() throws UnknownHostException {
        return userMongoOps.findAll(User.class);
    }
}
