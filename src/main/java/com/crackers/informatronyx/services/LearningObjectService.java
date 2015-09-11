/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.services;

import com.crackers.informatronyx.dao.LearningObjectDAO;
import com.crackers.informatronyx.dto.LearningObjectDto;
import com.crackers.informatronyx.models.LearningObject;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nelson
 */
public class LearningObjectService {
    public boolean getRequiredLearningElements(){ return false;}
    
    public List<LearningObjectDto> getAvailableLearningObjects() throws UnknownHostException{
        List<LearningObject> availableLO = LearningObjectDAO.getList();//LearningObjectDAO.getAllLearningObjectByDateUpload(new Date());
        List<LearningObjectDto> objects = new ArrayList<LearningObjectDto>();
        for(LearningObject model: availableLO){
            LearningObjectDto dto = new LearningObjectDto();
            dto.setId(model.getId());
            dto.setTitle(model.getTitle());
            dto.setDescription(model.getDescription());
            dto.setSubject(model.getSubject());
            dto.setPrice(model.getPrice());
            dto.setLikes(model.getLikes());
            dto.setDownloads(model.getDownloads());
            dto.setUploadDate(model.getUploadDate());
            dto.setSequence(model.getSequence());
            objects.add(dto);
        }
        return objects;
    }
    
    public List<LearningObjectDto> getMostLikedLearningObjects() throws UnknownHostException {
        List<LearningObject> mostLikedLO = LearningObjectDAO.getMostLikedList();
        List<LearningObjectDto> objects = new ArrayList<LearningObjectDto>();
        
        for(LearningObject model: mostLikedLO) {
            LearningObjectDto dto = new LearningObjectDto();
            dto.setId(model.getId());
            dto.setTitle(model.getTitle());
            dto.setDescription(model.getDescription());
            dto.setSubject(model.getSubject());
            dto.setPrice(model.getPrice());
            dto.setLikes(model.getLikes());
            dto.setDownloads(model.getDownloads());
            dto.setUploadDate(model.getUploadDate());
            dto.setSequence(model.getSequence());
            objects.add(dto);
        }
        return objects;
    }
    
   
    public boolean uploadAvaiableLearningObjects(LearningObjectDto[] objects) {
        boolean ok  = false;
        for(LearningObjectDto obj : objects){
            try {
                LearningObject model = new LearningObject();
                model.setTitle(obj.getTitle());
                model.setDescription(obj.getDescription());
                model.setDownloads(obj.getDownloads());
                model.setId(obj.getId());
                model.setLikes(obj.getLikes());
                model.setPrice(obj.getPrice());
                model.setSubject(obj.getSubject());
                model.setUploadDate(obj.getUploadDate());
                LearningObjectDAO.addLearningObject(model);
                ok = true;
            } catch (UnknownHostException ex) {
            }
        }
        return ok;
    }
}
