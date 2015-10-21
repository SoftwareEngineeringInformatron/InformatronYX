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
import com.crackers.informatronyx.services.LearningObjectService;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
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
    
    @Autowired LearningObjectService loService;
    
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
        dto.setSequence(new ArrayList<LearningElement[]>());
        // FIST PAGE
        LearningElement[] elements = new LearningElement[2];
        elements[0] = new LearningElement();
        elements[0].setTitle("Element 1");
        elements[0].setId("el1");
        elements[0].setType(".txt");
        elements[1] = new LearningElement();
        elements[1].setTitle("Element 2");
        elements[1].setId("el2");
        elements[1].setType("mp3");
        
        // SECOND PAGE
        LearningElement[] elements2 = new LearningElement[2];
        elements2[0] = new LearningElement();
        elements2[0].setTitle("Element 3");
        elements2[0].setId("el3");
        elements2[0].setFileExtension(".mp4");
        elements2[1] = new LearningElement();
        elements2[1].setTitle("Element 4");
        elements2[1].setId("el4");
        elements2[1].setFileExtension(".pptx");
        
        dto.getSequence().add(elements); // ADD PAGE 1
        dto.getSequence().add(elements2);// ADD PAGE 2
        return dto;
    }
    
    public Boolean purchaseLO(LOTransactionDto transact) {
        LOTransactionDto dto = new LOTransactionDto();
        dto.getAmount();
        return true;
    }
    
    @RequestMapping("/upload/availableLOs")
    public Boolean uploadAvaiableLearningObjects(
            @RequestBody LearningObjectDto[] objects,
            HttpServletResponse response
            ) 
    {
        return loService.uploadAvaiableLearningObjects(objects);
    }
}
