/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.controllers;

import com.crackers.informatronyx.dto.QuizDto;
import com.crackers.informatronyx.services.QuizService;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Andrew Paul Mago
 */

@RestController
@RequestMapping("/quiz")
public class QuizController {
    @Autowired QuizService q;
    
    @RequestMapping("/submit")
    public QuizDto submit(@RequestBody QuizDto quiz) throws UnknownHostException {
        try {
            if(!q.record(quiz)) {
                quiz.getErrorList().add("Failed to record");
            }
        } catch(NullPointerException ae) {quiz.getErrorList().add(ae.getMessage());}
        
            return quiz;
    }
    
    /*
    @RequestMapping("/delete")
    public QuizDto delete(@RequestBody QuizDto quiz) throws UnknownHostException {
        try {
            if(!q.delete(quiz)) {
                quiz.getErrorList().add("Failed to delete");
            }
        } catch(NullPointerException ae) {quiz.getErrorList().add(ae.getMessage());}
        finally {return quiz;}
    }
    */
    
    @RequestMapping("/loresult")
    public List<QuizDto> loresult(@RequestBody QuizDto quiz) throws UnknownHostException {
        List<QuizDto> quizResults = new ArrayList<QuizDto>();
        try {
            quizResults = q.getQuizResults(quiz,"LOSpecific");
            if(quizResults==null) {
                quiz.getErrorList().add("Failed to retrieve");
            }
        } catch(NullPointerException ae) {quiz.getErrorList().add(ae.getMessage());}
            
            return quizResults;
    }
    
    @RequestMapping("/userresult")
    public List<QuizDto> userresult(@RequestBody QuizDto quiz) throws UnknownHostException {
        List<QuizDto> quizResults = new ArrayList<QuizDto>();
        try {
            quizResults = q.getQuizResults(quiz,"userSpecific");
            if(quizResults==null) {
                quiz.getErrorList().add("Failed to retrieve");
            }
        } catch(NullPointerException ae) {quiz.getErrorList().add(ae.getMessage());}
        
            return quizResults;
    }
    
    @RequestMapping("/usersresult")
    public List<QuizDto> usersresult(@RequestBody QuizDto quiz) throws UnknownHostException {
        List<QuizDto> quizResults = new ArrayList<QuizDto>();
        try {
            quizResults = q.getQuizResults(quiz,"NASpecific");
            if(quizResults==null) {
                quiz.getErrorList().add("Failed to retrieve");
            }
        } catch(NullPointerException ae) {quiz.getErrorList().add(ae.getMessage());}
        
            return quizResults;
    }
    
    @RequestMapping("/results")
    public List<QuizDto> results() throws UnknownHostException {
        List<QuizDto> quizResults = new ArrayList<QuizDto>();
        try {
            quizResults = q.getQuizResults(new QuizDto(),"");
            if(quizResults==null) {
                System.out.println("Failed to retrieve");
            }
        } catch(NullPointerException ae) {System.out.println("Controller Error!");}
        
            return quizResults;
    }
    
}
