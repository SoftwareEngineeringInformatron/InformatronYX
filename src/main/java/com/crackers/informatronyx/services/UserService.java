/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.services;

import com.crackers.informatronyx.dao.UserDAO;
import com.crackers.informatronyx.dto.UserDto;
import com.crackers.informatronyx.models.User;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Ted Ian Osias
 */
public class UserService {
    
    public boolean verify(UserDto user){return false;}
    public UserDto login(UserDto user) throws UnknownHostException{
        User userModel = UserDAO.getUser(user.getUsername(), user.getPassword());
        if(userModel != null){
            user.setId(userModel.getId());
            user.setEmail(userModel.getEmail());
            user.setFirstName(userModel.getFirstName());
            user.setLastName(userModel.getLastName());
            user.setLastDownloadDate(userModel.getLastDownloadDate());
            user.setLastDownloadId(userModel.getLastDownloadId());
            user.setLastLogin(new Date());
            userModel.generateToken();
            user.setApproved(userModel.isApproved());
            user.setBlocked(userModel.isBlocked());
            user.setFunctionType(userModel.getFunctionType());
            user.setUserType(userModel.getUserType());
            user.setToken(userModel.getToken());
            
        }
        return user;
    }
    public boolean register(UserDto user) throws UnknownHostException{
        boolean ok = false;
        if(!UserDAO.exists(user.getUsername())){
            User model = new User();
            model.setUsername(user.getUsername());
            model.setPassword(user.getPassword());
            model.setFirstName(user.getFirstName());
            model.setLastName(user.getLastName());
            UserDAO.addUser(model);
            ok = true;
        }
        return ok;
    }
    public boolean edit(UserDto user) throws UnknownHostException{return false;}
    public boolean block(UserDto user) throws UnknownHostException{return false;}
    public boolean unblock(UserDto user) throws UnknownHostException{return false;}
    public UserDto promote(String username) throws UnknownHostException{return null;}
    public UserDto demote(String username) throws UnknownHostException{return null;}
    public UserDto getUserInfo(UserDto user) throws UnknownHostException{return null;}
    public List<UserDto> getAllUsers(UserDto user) throws UnknownHostException{return null;}
    public List<UserDto> getAllAdmin(UserDto user) throws UnknownHostException{return null;}
    public List<UserDto> getAllCommonUsers(UserDto user) throws UnknownHostException{return null;}
    public List<UserDto> getAllPendingUsers(UserDto user) throws UnknownHostException{return null;}
    public boolean appoveUserRegistration(UserDto user) throws UnknownHostException{return false;}
    
    
    
}
