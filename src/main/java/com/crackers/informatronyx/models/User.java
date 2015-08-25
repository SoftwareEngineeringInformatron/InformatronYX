/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.data.annotation.Id;




/**
 *
 * @author Ted Ian Osias
 */
public class User{
    public static int USERTYPE_SUPERADMIN = 3;
    public static int USERTYPE_ADMIN = 2;
    public static int USERTYPE_COMMON = 1;
    @Id
    private String id;
    private String password;
    private String username;
    private String email;
    private int userType;
    private String firstName;
    private String lastName;
    private Date lastLogin;
    private Date lastDownloadDate;
    private String lastDownloadId;
    private List<LearningObject> liableLearningObjects;
    private String token;
    public User(){
        liableLearningObjects = new ArrayList<>();
    }
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getUserType() {
        return userType;
    }

    public void setUserType(int userType) throws Exception {
        if(userType>0 && userType <4)
            this.userType = userType;
        else
            throw new Exception("Invalid Usertype");
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public Date getLastDownloadDate() {
        return lastDownloadDate;
    }

    public void setLastDownloadDate(Date lastDownloadDate) {
        this.lastDownloadDate = lastDownloadDate;
    }

    public String getLastDownloadId() {
        return lastDownloadId;
    }

    public void setLastDownloadId(String lastDownloadId) {
        this.lastDownloadId = lastDownloadId;
    }

    public List<LearningObject> getLiableLearningObjects() {
        return liableLearningObjects;
    }

    public void setLiableLearningObjects(List<LearningObject> liableLearningObjects) {
        this.liableLearningObjects = liableLearningObjects;
    }
    public void generateToken()
    {
        this.token = java.util.UUID.randomUUID().toString();
    }

    public String getToken() {
        return token;
    }
    
}
