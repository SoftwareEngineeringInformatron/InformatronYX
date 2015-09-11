/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.controllers;

import com.crackers.informatronyx.dto.LearningObjectDto;
import com.crackers.informatronyx.models.LearningElement;
import com.crackers.informatronyx.models.LearningObject;
import com.crackers.informatronyx.services.LearningObjectService;
import com.crackers.informatronyx.services.UserService;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Nelson
 */
@RestController
@RequestMapping("/LO")
public class LearningObjectController {
    @RequestMapping("/downloadLO")
    public void download(@RequestBody LearningObject object) throws UnknownHostException {
        
    }
    
    @RequestMapping("/downloadLE")
    public byte download(@RequestBody LearningElement element) throws UnknownHostException {
        return 1;
    }
    
    @RequestMapping("/availableLearningObjects")
    public List<LearningObjectDto> availableLearningObjects(){
        List<LearningObjectDto> dtos = new ArrayList<>();
        try{
            dtos = (new LearningObjectService()).getAvailableLearningObjects();
        }catch(Exception e){ e.printStackTrace(); }
        return dtos;
    }
    
    @RequestMapping("/mostLiked")
    public List<LearningObjectDto> mostLikedLearningObjects(){
        List<LearningObjectDto> dtos = new ArrayList<>();
        try{
            dtos = (new LearningObjectService()).getMostLikedLearningObjects();
        }catch(Exception e){ e.printStackTrace(); }
        return dtos;
    }
    
    @RequestMapping("/mostDownloaded")
    public List<LearningObjectDto> mostDownloadedLearningObjects(){
        List<LearningObjectDto> dtos = new ArrayList<>();
        try{
            dtos = (new LearningObjectService()).getMostDownloadedLearningObjects();
        }catch(Exception e){ e.printStackTrace(); }
        return dtos;
    }
    
    public List<LearningObject> purchaseLearningObjects() throws UnknownHostException {
        return null;
    }
    
    @RequestMapping("/upload/avaiableLOs")
    public Boolean uploadAvaiableLearningObjects(@RequestBody LearningObjectDto[] objects) throws UnknownHostException {
        LearningObjectService service = new LearningObjectService ();
        service.uploadAvaiableLearningObjects(objects);
        return true;
    }
}
