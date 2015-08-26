/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dto;

import com.crackers.informatronyx.models.LearningObject;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Ted Ian Osias
 */
public class UserDto implements Serializable {
    
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
    private List<String> errorList;
    public UserDto(){
        errorList = new ArrayList<String>();
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

    public void setUserType(int userType) {
        this.userType = userType;
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

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public List<String> getErrorList() {
        return errorList;
    }
    
    
    
    
}
