/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dto;

import com.crackers.informatronyx.models.LearningObject;
import com.crackers.informatronyx.models.User;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Ted Ian Osias
 */
public class UserDto implements Serializable {
    
    private String id;
    private String username;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
    private Date lastLogin;
    private Date lastDownloadDate;
    private String lastDownloadId;
    private List<LearningObject> liableLearningObjects;
    private String token;
    private boolean approved;
    private boolean blocked;
    private String userType;
    private int functionType;
    private List<String> errorList;
    public UserDto(){
        errorList = new ArrayList<String>();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public boolean isApproved() {
        return approved;
    }

    public void setApproved(boolean approved) {
        this.approved = approved;
    }

    public boolean isBlocked() {
        return blocked;
    }

    public void setBlocked(boolean blocked) {
        this.blocked = blocked;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public int getFunctionType() {
        return functionType;
    }

    public void setFunctionType(int functionType) {
        this.functionType = functionType;
    }

    public List<String> getErrorList() {
        return errorList;
    }

    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }
    
    public void setData(User model){
        this.id = model.getId();
        this.username = model.getUsername();
        this.password = model.getPassword();
        this.firstName = model.getFirstName();
        this.lastName = model.getLastName();
        this.email = model.getEmail();
        this.lastLogin = model.getLastLogin();
        this.lastDownloadDate = model.getLastDownloadDate();
        this.lastDownloadId = model.getLastDownloadId();
        this.liableLearningObjects = model.getLiableLearningObjects();
        this.token = model.getToken();
        this.approved = model.isApproved();
        this.blocked = model.isBlocked();
        this.userType = model.getUserType();
        this.functionType = model.getFunctionType();
    }
    
    
    
}
