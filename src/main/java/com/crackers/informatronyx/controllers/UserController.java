/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.controllers;

import com.crackers.informatronyx.dto.UserDto;
import com.crackers.informatronyx.services.UserService;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Ted Ian Osias
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired UserService service;
    @RequestMapping("/get")
    public UserDto getUser(@RequestBody UserDto user) throws UnknownHostException{
        
        user = service.getUserInfo(user);
        return user;
    }
    
    
    @RequestMapping("/signup")
    public UserDto signup(@RequestBody UserDto user) throws UnknownHostException
    {
        try{
        
        boolean ok = service.register(user);
        if(ok==false)
            user.getErrorList().add("Registration unsucessful.");
        }catch(Exception e){
            user.getErrorList().add(e.toString());
        }
        return user;
    }
    
    @RequestMapping("/remove")
    public boolean remove(@RequestBody UserDto user){
        boolean ok = false;
        try{
            ok = service.removeUser(user);
        if(ok==false)
            user.getErrorList().add("Registration unsucessful.");
        }catch(Exception e){
            
        }
        return ok;
    }
    
    @RequestMapping("/login")
    public UserDto login(@RequestBody UserDto user) throws UnknownHostException
    {
        try{
        
        UserDto result = service.login(user);
        if(!result.isApproved()){
            user.getErrorList().add("User account is not yet approved by admin.");
        }
        if(result==null)
            user.getErrorList().add("Registration unsucessful.");
        }catch(Exception e){
            user.getErrorList().add(e.toString());
        }
        return user;
    }
    @RequestMapping("/validate")
    public List<String> validate(@RequestBody UserDto user){
        List<String> errorList = new ArrayList<>();
        try{
             errorList = service.verify(user);
        } catch (UnknownHostException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.CONFIG, "MongoDB is not connected");
        }
        return errorList;
    }
    
    @RequestMapping("/edit")
    public boolean edit(@RequestBody UserDto user){
        boolean ok = false;
        
        
        try {
            ok = service.edit(user);
        } catch (UnknownHostException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.CONFIG, "MongoDB is not connected");
        } catch (Exception ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.INFO, ex.getMessage());
        }
        return ok;
    }
    
    @RequestMapping("/approve")
    public boolean approve(@RequestBody UserDto user){
        boolean ok = false;
        
        try {
            ok  = service.appoveUserRegistration(user);
        } catch (UnknownHostException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.CONFIG, "MongoDB is not connected");
        } catch (Exception ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.INFO, ex.getMessage());
        }
        return ok;
    }
    
    @RequestMapping("/promote")
    public boolean promote(@RequestBody UserDto user){
        boolean ok = false;
        
        try {
            ok  = service.promote(user)!=null;
        } catch (UnknownHostException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.CONFIG, "MongoDB is not connected");
        } catch (Exception ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.INFO, ex.getMessage());
        }
        return ok;
    }
    
    @RequestMapping("/demote")
    public boolean demote(@RequestBody UserDto user){
        boolean ok = false;
        
        try {
            ok  = service.demote(user)!=null;
        } catch (UnknownHostException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.CONFIG, "MongoDB is not connected");
        } catch (Exception ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.INFO, ex.getMessage());
        }
        return ok;
    }
    
    @RequestMapping("/block")
    public boolean block(@RequestBody UserDto user){
        boolean ok = false;
        
        try {
            ok  = service.block(user);
        } catch (UnknownHostException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.CONFIG, "MongoDB is not connected");
        } catch (Exception ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.INFO, ex.getMessage());
        }
        return ok;
    }
    
    @RequestMapping("/unblock")
    public boolean unblock(@RequestBody UserDto user){
        boolean ok = false;
        
        try {
            ok  = service.unblock(user);
        } catch (UnknownHostException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.CONFIG, "MongoDB is not connected");
        } catch (Exception ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.INFO, ex.getMessage());
        }
        return ok;
    }
    
    @RequestMapping("/admins")
    public List<UserDto> admins(){
        List<UserDto> admins = new ArrayList<>();
        
        try {
            admins = service.getAllAdmin();
        } catch (UnknownHostException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.CONFIG, "MongoDB is not connected");
        }
        return admins;
    }
    
    @RequestMapping("/commonUsers")
    public List<UserDto> commonUsers(){
        List<UserDto> commonUsers = new ArrayList<>();
        
        try {
            commonUsers = service.getAllCommonUsers();
        } catch (UnknownHostException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.CONFIG, "MongoDB is not connected");
        }
        return commonUsers;
    }
    @RequestMapping("/pendingUsers")
    public List<UserDto> pendingUsers(UserDto user){
        List<UserDto> commonUsers = new ArrayList<>();
        
        try {
            commonUsers = service.getAllPendingUsers();
        } catch (UnknownHostException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.CONFIG, "MongoDB is not connected");
        }
        return commonUsers;
    }
    @RequestMapping("/allUsers")
    public List<UserDto> allUsers(){
        List<UserDto> commonUsers = new ArrayList<>();
        
        try {
            commonUsers = service.getAllUsers();
        } catch (UnknownHostException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.CONFIG, "MongoDB is not connected");
        }
        return commonUsers;
    }
    
    @RequestMapping("/blocked")
    public List<UserDto> blockedUsers(){
        List<UserDto> blockedUsers = new ArrayList<>();
        
        try {
            List<UserDto> all = service.getAllUsers();
            for(int i=0;i<all.size();i++){
                UserDto user = all.get(i);
                if(user.isBlocked() == true)
                    blockedUsers.add(user);
            }
        } catch (UnknownHostException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.CONFIG, "MongoDB is not connected");
        }
        return blockedUsers;
    }
    public static long userInactiveThreshold = 1209600000; // 2 Weeks this is in milliseconds
    @RequestMapping("/inactive")
    public List<UserDto> inactiveUsers(){
        List<UserDto> inactiveUsers = new ArrayList<>();
        
        try {
            List<UserDto> all = service.getAllUsers();
            Date today = new Date();
            String date = today.toString();
            for(int i=0;i<all.size();i++){
                UserDto user = all.get(i);
                if(user.getLastLogin()!=null){
                    long difference = today.getTime() - user.getLastLogin().getTime();
                    if(difference >= userInactiveThreshold)
                        inactiveUsers.add(user);
                }else
                    inactiveUsers.add(user);
            }
        } catch (UnknownHostException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.CONFIG, "MongoDB is not connected");
        }
        return inactiveUsers;
    }
    
    @RequestMapping("/exists")
    public boolean exists(@RequestBody UserDto user){
        
        return service.exists(user.getUsername());
    }
}
