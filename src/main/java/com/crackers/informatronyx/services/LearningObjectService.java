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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nelson
 */
public class LearningObjectService {
    public boolean getRequiredLearningElements(){ return false;}

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
