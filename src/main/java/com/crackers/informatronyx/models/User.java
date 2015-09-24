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
    public static final int FUNCTION_SUPERADMIN = 4;
    public static final int FUNCTION_ADMIN_APPROVAL = 2;
    public static final int FUNCTION_ADMIN_METERING = 3;
    public static final int FUNCTION_COMMON = 1;
    public static final int FUNCTION_GUEST = 0;
    public static final String USERTYPE_SUPERADMIN = "Super Admin";
    public static final String USERTYPE_ADMIN = "Admin";
    public static final String USERTYPE_COMMON = "User";
    public static final String USERTYPE_GUEST = "Guest";
    
    @Id
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
    private float credits = 0.0f;
    
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
    public boolean isApproved() {
        return approved;
    }

    public void setApproved(boolean approved) {
        this.approved = approved;
    }
    public User(){
        liableLearningObjects = new ArrayList<>();
        this.userType = User.USERTYPE_GUEST;
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

    public float getCredits() {
        return credits;
    }

    public void setCredits(float credits) {
        this.credits = credits;
    }
    
}
