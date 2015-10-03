/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.controllers;

import com.crackers.informatronyx.dto.LOTransactionDto;
import com.crackers.informatronyx.dto.LearningObjectDto;
import com.crackers.informatronyx.models.LearningElement;
import com.crackers.informatronyx.models.LearningObject;
import com.crackers.informatronyx.models.LearningObjectTransaction;
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
    
    LearningObjectService loService = new LearningObjectService();
    
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
            dtos = loService.getAvailableLearningObjects();
        }catch(Exception e){ e.printStackTrace(); }
        return dtos;
    }
    
    @RequestMapping("/mostLiked")
    public List<LearningObjectDto> mostLikedLearningObjects(){
        List<LearningObjectDto> dtos = new ArrayList<>();
        try{
            dtos = loService.getMostLikedLearningObjects();
        }catch(Exception e){ e.printStackTrace(); }
        return dtos;
    }
    
    @RequestMapping("/mostDownloaded")
    public List<LearningObjectDto> mostDownloadedLearningObjects(){
        List<LearningObjectDto> dtos = new ArrayList<>();
        try{
            dtos = loService.getMostDownloadedLearningObjects();
        }catch(Exception e){ e.printStackTrace(); }
        return dtos;
    }
    
    public List<LearningObject> purchaseLearningObjects() throws UnknownHostException {
        return null;
    }
    
    @RequestMapping("/testing")
    public LearningObjectDto test() {
        LearningObjectDto dto = new LearningObjectDto();
        LearningElement le = new LearningElement();
        le.setTitle("Titulo");
        le.setId("123");
        dto.setSequence(new ArrayList<LearningElement>());
        dto.getSequence().add(le);
        return dto;
    }
    
    public Boolean purchaseLO(LOTransactionDto transact) {
        LOTransactionDto dto = new LOTransactionDto();
        dto.getAmount();
        return true;
    }
    
    @RequestMapping("/upload/avaiableLOs")
    public Boolean uploadAvaiableLearningObjects(@RequestBody LearningObjectDto[] objects) throws UnknownHostException {
        //LearningObjectService service = new LearningObjectService ();
        loService.uploadAvaiableLearningObjects(objects);
        return true;
    }
}
