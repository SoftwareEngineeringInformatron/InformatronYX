/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.services;

import com.crackers.informatronyx.dto.UserDto;

/**
 *
 * @author Ted Ian Osias
 */
public class UserService {
    
    public boolean promote(UserDto user){
        return true;
    
    }
    public boolean demote(UserDto user){return true;}
    public boolean register(UserDto user){return true;}
    public boolean login(UserDto user){return false;}
    
}
