/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.controllers;

import com.crackers.informatronyx.dto.QuizDto;
import com.crackers.informatronyx.dto.UserDto;
import com.crackers.informatronyx.models.LearningObject;
import com.crackers.informatronyx.services.QuizService;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
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
            QuizService q = new QuizService();
    
    @RequestMapping("/submit")
    public QuizDto submit(@RequestBody QuizDto quiz) throws UnknownHostException {
        try {
            if(!q.record(quiz)) {
                quiz.getErrorList().add("Failed to record");
            }
        } catch(NullPointerException ae) {quiz.getErrorList().add(ae.getMessage());}
         finally {return quiz;}
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
    public QuizDto loresult(@RequestBody QuizDto quiz) throws UnknownHostException {
        try {
            if(q.getQuizResultsOfUserFromSpecificLearningObject(quiz)==null) {
                quiz.getErrorList().add("Failed to retrieve");
            }
        } catch(NullPointerException ae) {quiz.getErrorList().add(ae.getMessage());}
        finally {return quiz;}
    }
    
    @RequestMapping("/userresult")
    public QuizDto userresult(@RequestBody QuizDto quiz) throws UnknownHostException {
        try {
            if(q.getQuizResultsOfUser(quiz)==null) {
                quiz.getErrorList().add("Failed to retrieve");
            }
        } catch(NullPointerException ae) {quiz.getErrorList().add(ae.getMessage());}
        finally {return quiz;}
    }
    
    @RequestMapping("/results")
    public List<QuizDto> results(@RequestBody QuizDto quiz) throws UnknownHostException {
        List<QuizDto> quizResults = new ArrayList<QuizDto>();
        try {
            quizResults = q.getQuizResultsOfLearningObject(quiz);
            if(quizResults==null) {
                quiz.getErrorList().add("Failed to retrieve");
            }
        } catch(NullPointerException ae) {quiz.getErrorList().add(ae.getMessage());}
        finally{return quizResults;}
    }
    
}
