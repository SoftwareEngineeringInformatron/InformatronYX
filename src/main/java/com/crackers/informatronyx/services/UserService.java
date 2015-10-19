/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.services;

import com.crackers.informatronyx.dao.LearningObjectDAO;
import com.crackers.informatronyx.dao.UserDAO;
import com.crackers.informatronyx.dto.UserDto;
import com.crackers.informatronyx.models.LearningObject;
import com.crackers.informatronyx.models.User;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Ted Ian Osias
 */
@Service
public class UserService {
    @Autowired UserDAO dao;
    @Autowired LearningObjectDAO loDao;
    
    
    public List<String> verify(UserDto user) throws UnknownHostException{
        List<String> errorList = new ArrayList<>();
        User model = dao.getUser(user.getUsername(), user.getPassword());
        if(model==null)
            errorList.add("User does not exist.");
        else{
            if(model.getToken() == null){
                errorList.add("Access token not found. User not yet able to login. Please login.");
            }
            if(user.getToken() == null)
                errorList.add("No Acces Token found.");
            else if(!(user.getToken().equals(model.getToken())))
                errorList.add("Outdated Access Token.");
        }
        
        return errorList;
    
    }
    public UserDto login(UserDto user) throws UnknownHostException, Exception{
        User userModel = dao.getUser(user.getUsername(), user.getPassword());
        if(userModel != null){
            if(userModel.isBlocked())
                throw new Exception("User is blocked");
            user.setData(userModel);
            userModel.setLastLogin(new Date());
            userModel.generateToken();
            user.setData(updateUserLOs(userModel));
            LearningObject [] objects = new LearningObject [userModel.getLiableLearningObjects().toArray().length];
            objects = userModel.getLiableLearningObjects().toArray(objects);
            for(int i=0;i<objects.length;i++){
                for(LearningObject obj2: user.getLiableLearningObjects()){
                    if(obj2.getId().equals(objects[i].getId())){
                        objects[i].setTitle(obj2.getTitle());
                        objects[i].setDescription(obj2.getDescription());
                        objects[i].setLikes(obj2.getLikes());
                        objects[i].setDownloads(obj2.getLikes());
                        objects[i].setSequence(obj2.getSequence());
                        objects[i].setSubject(obj2.getSubject());
                        objects[i].setPrice(obj2.getPrice());
                        objects[i].setUploadDate(obj2.getUploadDate());
                    }
                }
            }
            user.setLastLogin(userModel.getLastLogin());
            user.setToken(userModel.getToken());
            if(!dao.editUser(userModel))
                user = null;
        }
        return user;
    }
    
    private User updateUserLOs(User user){
        List<LearningObject> newLOs = new ArrayList<LearningObject>();
        for(LearningObject old : user.getLiableLearningObjects()){
            newLOs.add(loDao.getLearningObjectById(old.getId()));
        }
        user.setLiableLearningObjects(newLOs);
        return user;
    }
    
    public boolean register(UserDto user) throws UnknownHostException{
        boolean ok = false;
        if(!dao.exists(user.getUsername())){
            User model = new User();
            model.setUsername(user.getUsername());
            model.setPassword(user.getPassword());
            model.setFirstName(user.getFirstName());
            model.setLastName(user.getLastName());
            model.setEmail(user.getEmail());
            model.setFunctionType(user.getFunctionType());
            model = determineUserType(model);
            if(model.getUserType().equals(User.USERTYPE_ADMIN) || model.getUserType().equals(User.USERTYPE_SUPERADMIN))
                model.setApproved(true);
            dao.addUser(model);
            ok = true;
        }
        return ok;
    }
    
    private User determineUserType(User model){
        if(model.getFunctionType() == User.FUNCTION_ADMIN_APPROVAL || model.getFunctionType() == User.FUNCTION_ADMIN_METERING )
                model.setUserType(User.USERTYPE_ADMIN);
            else if(model.getFunctionType() == User.FUNCTION_SUPERADMIN)
                model.setUserType(User.USERTYPE_SUPERADMIN);
            else if(model.getFunctionType() == User.FUNCTION_COMMON)
                model.setUserType(User.USERTYPE_COMMON);
            else
                model.setUserType(User.USERTYPE_GUEST);
        return model;
    }
    
    
    public boolean edit(UserDto user) throws UnknownHostException, Exception{
        boolean ok = false;
        User model = dao.getUser(user.getId());
        if( model !=null)
        {
            model.setFirstName(user.getFirstName());
            model.setLastName(user.getLastName());
            model.setUsername(user.getUsername());
            model.setPassword(user.getPassword());
            model.setEmail(user.getEmail());
            model.setApproved(user.isApproved());
            model.setBlocked(user.isBlocked());
            model.setFunctionType(user.getFunctionType());
            ok = dao.editUser(model);
        }
        else
            throw new Exception("User does not exist. ");
        return ok;
    }
    public boolean block(UserDto user) throws UnknownHostException, Exception{
        boolean ok = false;
        User model = dao.getUser(user.getId());
        if(model!= null){
            model.setBlocked(true);
            dao.editUser(model);
            ok = true;
        }
        else
            throw new Exception("User does not exist. ");
        return ok;
    }
    public boolean unblock(UserDto user) throws UnknownHostException, Exception{
        boolean ok = false;
        User model = dao.getUser(user.getId());
        if(model!= null){
            model.setBlocked(false);
            dao.editUser(model);
            ok = true;
        }
        else
            throw new Exception("User does not exist. ");
        return ok;
    }
    public UserDto promote(UserDto user) throws UnknownHostException, Exception{
        User model = dao.getUser(user.getId());
        if(model== null)
            throw new Exception("User does not exist. ");
        else
        {
            if(model.getUserType() == User.USERTYPE_SUPERADMIN)
                throw new Exception("User cannot be promoted anymore.");
            else
            {
                model.setFunctionType(user.getFunctionType());
                model = determineUserType(model);
                if(!dao.editUser(model))
                    model = null;
            }
        }
        UserDto dto = null;
        if(model!=null){
            dto = new UserDto();
            dto.setData(model);
        }
        return dto;
    }
    public UserDto demote(UserDto user) throws UnknownHostException, Exception{
        User model = dao.getUser(user.getId());
        if(model== null)
            throw new Exception("User does not exist. ");
        else
        {
            if(model.getUserType().equals(User.USERTYPE_COMMON))
                throw new Exception("User cannot be demoted anymore.");
            else
            {
                model.setFunctionType(user.getFunctionType());
                model = determineUserType(model);
                switch(model.getUserType()){
                    case User.USERTYPE_ADMIN : model.setUserType(User.USERTYPE_COMMON);break;
                }
                if(!dao.editUser(model))
                    model = null;
            }
        }
        UserDto dto = null;
        if(model!=null){
            dto = new UserDto();
            dto.setData(model);
        }
        return dto;
    }
    public UserDto getUserInfo(UserDto user) throws UnknownHostException{
        User model = dao.getUser(user.getId());
        if(model!=null)
            user.setData(model);
        else 
            user = null;
        return user;
    }
    public List<UserDto> getAllUsers() throws UnknownHostException{
        return modelsToDto(dao.getAllUsers());
    }
    public List<UserDto> getAllAdmin() throws UnknownHostException{
        List<UserDto> admins = modelsToDto(dao.getAllUserOfType(User.USERTYPE_ADMIN));
        admins.addAll(modelsToDto(dao.getAllUserOfType(User.USERTYPE_SUPERADMIN)));
        return admins;
    }
    public List<UserDto> getAllCommonUsers() throws UnknownHostException{
        return modelsToDto(dao.getAllUserOfType(User.USERTYPE_COMMON));
    }
    public List<UserDto> getAllPendingUsers() throws UnknownHostException{
        return modelsToDto(dao.getUserByPropertyAndValue("approved", false));
    }
    public boolean appoveUserRegistration(UserDto user) throws UnknownHostException, Exception{
        boolean ok = false;
        User model = dao.getUser(user.getId());
        if(model!= null){
            model.setApproved(true);
            model.setFunctionType(User.FUNCTION_COMMON);
            model.setUserType(User.USERTYPE_COMMON);    
            dao.editUser(model);
            ok = true;
        }
        else
            throw new Exception("User does not exist. ");
        return ok;
    }
    
    // HELPER FUNCTIONS
    private List<UserDto> modelsToDto(List<User> models){
        List<UserDto> users = new ArrayList<>();
        if(models!=null)
        for(User model: models){
            UserDto user = new UserDto();
            user.setData(model);
            users.add(user);
        }
        return users;
    }

    public boolean exists(String username) {
        try{
            return dao.exists(username);
        }catch(Exception e){
            return false;
        }
    }

    public boolean removeUser(UserDto user) {
        try {
            User model = new User();
            model.setId(user.getId());
            return dao.deleteUser(model);
        } catch (UnknownHostException ex) {
            return false;
        }
    }
    
}
