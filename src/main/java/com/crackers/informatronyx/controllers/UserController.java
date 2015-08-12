/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.controllers;

import com.crackers.informatronyx.models.User;
import com.mongodb.Mongo;
import java.net.UnknownHostException;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.SimpleMongoDbFactory;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;
import static org.springframework.data.mongodb.core.query.Update.update;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Ted Ian Osias
 */
@RestController
@RequestMapping("/user")
public class UserController {
    
    @RequestMapping("/addUser")
    public boolean addUserTest() throws UnknownHostException
    {
        MongoOperations mongoOps = new MongoTemplate(new SimpleMongoDbFactory(new Mongo(), "database"));
        Boolean ok = false;
        User p = new User("Username" , "Test password");
        mongoOps.insert(p);
        System.out.println(p);
        ok = true;
        return ok;
    }
    @RequestMapping("/getUser")
    public User getUserTest() throws UnknownHostException
    {
        MongoOperations mongoOps = new MongoTemplate(new SimpleMongoDbFactory(new Mongo(), "database"));
        User p = null;
        p = mongoOps.findOne(query(where("username").is("Username")), User.class);
        System.out.println(p.toString());
        return p;
    }
    @RequestMapping("/updateUser")
    public boolean updateUserTest() throws UnknownHostException
    {
        MongoOperations mongoOps = new MongoTemplate(new SimpleMongoDbFactory(new Mongo(), "database"));
        boolean ok = false;
        mongoOps.updateFirst(query(where("username").is("Username")),update("age",23),User.class);
        ok = true;
        return ok;
    }
    @RequestMapping("/deleteUser")
    public boolean deleteUserTest() throws UnknownHostException
    {
        MongoOperations mongoOps = new MongoTemplate(new SimpleMongoDbFactory(new Mongo(), "database"));
        boolean ok = false;
        mongoOps.remove(query(where("username").is("Username")), User.class);
        ok = true;
        return ok;
    }
    
}
