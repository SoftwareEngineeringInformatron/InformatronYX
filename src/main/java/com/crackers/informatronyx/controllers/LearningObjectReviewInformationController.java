/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.controllers;

import com.crackers.informatronyx.dto.LearningObjectReviewInformationDto;
import com.crackers.informatronyx.services.LearningObjectReviewInformationService;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author User
 */

@RestController
@RequestMapping("/lori")
public class LearningObjectReviewInformationController {
    @Autowired LearningObjectReviewInformationService loriService;
    
    @RequestMapping("/submit")
    public LearningObjectReviewInformationDto submit(@RequestBody LearningObjectReviewInformationDto LORI) throws UnknownHostException {
        try {
            if(!loriService.submitReview(LORI))
                LORI.getErrorList().add("Failed to submit");
        } catch(NullPointerException ae) {System.out.println(ae.getMessage());}
            return LORI;
    }
    
    @RequestMapping("/edit")
    public LearningObjectReviewInformationDto edit(@RequestBody LearningObjectReviewInformationDto LORI) throws UnknownHostException {
        System.out.println("PASSED");
        try {
            if(!loriService.editReview(LORI))
                LORI.getErrorList().add("Failed to edit");
        } catch(NullPointerException ae) {System.out.println(ae.getMessage());}
            return LORI;
    }
    
    @RequestMapping("/delete")
    public LearningObjectReviewInformationDto delete(@RequestBody LearningObjectReviewInformationDto LORI) throws UnknownHostException {
        try {
            if(!loriService.deleteReview(LORI))
                LORI.getErrorList().add("Failed to delete");
        } catch(NullPointerException ae) {System.out.println(ae.getMessage());}
            return LORI;
    }
    
    @RequestMapping("/LORIs")
    public List<LearningObjectReviewInformationDto> getLORIs() throws UnknownHostException {
        List<LearningObjectReviewInformationDto> LORIviews = new ArrayList<LearningObjectReviewInformationDto>();
        try {
            LORIviews = loriService.getLORIs(new LearningObjectReviewInformationDto(), "");
            if(LORIviews == null)
                System.out.println("Failed to retrieve");
        } catch(NullPointerException ae) {System.out.println(ae.getMessage());}
            return LORIviews;
    }
    
    @RequestMapping("/LORIs/LOId")
    public List<LearningObjectReviewInformationDto> getLORIsbyLOId(@RequestBody LearningObjectReviewInformationDto LORI) throws UnknownHostException {
        List<LearningObjectReviewInformationDto> LORIviews = new ArrayList<LearningObjectReviewInformationDto>();
        try {
            LORIviews = loriService.getLORIs(LORI, "learningObjectId");
            if(LORIviews == null)
                System.out.println("Failed to retrieve");
        } catch(NullPointerException ae) {System.out.println(ae.getMessage());}
            return LORIviews;
    }
    
    @RequestMapping("/LORIs/reviewId")
    public List<LearningObjectReviewInformationDto> getLORIsbyReviewId(@RequestBody LearningObjectReviewInformationDto LORI) throws UnknownHostException {
        List<LearningObjectReviewInformationDto> LORIviews = new ArrayList<LearningObjectReviewInformationDto>();
        try {
            LORIviews = loriService.getLORIs(LORI, "reviewId");
            if(LORIviews == null)
                System.out.println("Failed to retrieve");
        } catch(NullPointerException ae) {System.out.println(ae.getMessage());}
            return LORIviews;
    }
    
    @RequestMapping("/LORIs/both")
    public List<LearningObjectReviewInformationDto> getLORIsbyBoth(@RequestBody LearningObjectReviewInformationDto LORI) throws UnknownHostException {
        List<LearningObjectReviewInformationDto> LORIviews = new ArrayList<LearningObjectReviewInformationDto>();
        try {
            LORIviews = loriService.getLORIs(LORI, "both");
            if(LORIviews == null)
                System.out.println("Failed to retrieve");
        } catch(NullPointerException ae) {System.out.println(ae.getMessage());}
            return LORIviews;
    }
    
}
