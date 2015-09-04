/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.controllers;

import com.crackers.informatronyx.dto.LearningObjectDto;
import com.crackers.informatronyx.models.LearningElement;
import com.crackers.informatronyx.models.LearningObject;
import java.net.UnknownHostException;
import java.util.List;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Nelson
 */
public class LearningObjectController {
    @RequestMapping("/downloadLO")
    public void download(@RequestBody LearningObject object) throws UnknownHostException {
        
    }
    
    @RequestMapping("/downloadLE")
    public byte download(@RequestBody LearningElement element) throws UnknownHostException {
        return 1;
    }
    
    public List<LearningObject> availableLearningObjects() throws UnknownHostException {
        return null;
    }
    
    public List<LearningObject> purchaseLearningObjects() throws UnknownHostException {
        return null;
    }
    
    
}
