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

/**
 *
 * @author Ted Ian Osias
 */
public class UserService {
    
    public boolean promote(String username) throws UnknownHostException{
        User model = new User();
        model.setUsername(username);
        model =UserDAO.getUser(model);
        if(model.getUserType()<3){
            model.setUserType(model.getUserType()+1);
            UserDAO.saveUser(model);
        }
        else return false;
        return true;
    }
    public boolean demote(String username) throws UnknownHostException{
        User model = new User();
        model.setUsername(username);
        model =UserDAO.getUser(model);
        if(model.getUserType()>1){
            model.setUserType(model.getUserType()-1);
            UserDAO.saveUser(model);
        }
        else return false;
        return true;
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
    public boolean login(UserDto user){return false;}
    
}
