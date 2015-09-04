/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.controllers;

import com.crackers.informatronyx.dto.QuizDto;
import com.crackers.informatronyx.services.QuizService;
import java.net.UnknownHostException;
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
    
    @RequestMapping("/submit")
    public QuizDto submit(@RequestBody QuizDto quiz) throws UnknownHostException {
        try {
            QuizService q = new QuizService();
            if(!q.record(quiz)) {
                quiz.getErrorList().add("Failed to record");
            }
        } catch(NullPointerException ae) {quiz.getErrorList().add(ae.getMessage());}
         finally {return quiz;}
    }
    
    @RequestMapping("/delete")
    public QuizDto delete(@RequestBody QuizDto quiz) throws UnknownHostException {
        try {
            QuizService q = new QuizService();
            if(!q.delete(quiz)) {
                quiz.getErrorList().add("Failed to delete");
            }
        } catch(NullPointerException ae) {quiz.getErrorList().add(ae.getMessage());}
        finally {return quiz;}
    }
    
    @RequestMapping("/resubmit")
    public QuizDto resubmit(@RequestBody QuizDto quiz) throws UnknownHostException {
        try {
            QuizService q = new QuizService();
            if(!q.edit(quiz)) {
                quiz.getErrorList().add("Failed to resubmit quiz");
            }
        } catch(NullPointerException ae) {quiz.getErrorList().add(ae.getMessage());}
         finally{return quiz;}
    }
    
    
}
