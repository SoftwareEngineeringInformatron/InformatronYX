/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.models;

import org.springframework.data.annotation.Id;




/**
 *
 * @author Ted Ian Osias
 */
public class User{
    @Id
    private String id;
    private String password;
    private String username;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    public User( String username,String password) {
        this.password = password;
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public String getUsername() {
        return username;
    }

    @Override
    public String toString() {
        return "User{ password=" + password + ", username=" + username + '}';
    }
    
}
