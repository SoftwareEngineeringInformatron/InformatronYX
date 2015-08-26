/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.controllers;

import com.crackers.informatronyx.dto.UserDto;
import com.crackers.informatronyx.models.User;
import com.crackers.informatronyx.services.UserService;
import com.mongodb.Mongo;
import java.net.UnknownHostException;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.SimpleMongoDbFactory;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;
import static org.springframework.data.mongodb.core.query.Update.update;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Ted Ian Osias
 */
@RestController
@RequestMapping("/user")
public class UserController {
    
    @RequestMapping("/signup")
    public UserDto signup(@RequestBody UserDto user) throws UnknownHostException
    {
        try{
        UserService service = new UserService();
        boolean ok = service.register(user);
        if(ok==false)
            user.getErrorList().add("Registration unsucessful.");
        }catch(Exception e){
            user.getErrorList().add(e.toString());
        }
        return user;
    }
    @RequestMapping("/login")
    public UserDto login(@RequestBody UserDto user) throws UnknownHostException
    {
        try{
        UserService service = new UserService();
        boolean ok = service.register(user);
        if(ok==false)
            user.getErrorList().add("Registration unsucessful.");
        }catch(Exception e){
            user.getErrorList().add(e.toString());
        }
        return user;
    }
}
