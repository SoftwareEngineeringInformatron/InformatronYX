/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.services;

import com.crackers.informatronyx.dao.QuizDAO;
import com.crackers.informatronyx.dto.QuizDto;
import com.crackers.informatronyx.models.Quiz;
import java.net.UnknownHostException;
import java.util.List;

/**
 *
 * @author User
 */
public class QuizService {
    
    public boolean record(QuizDto quiz) throws UnknownHostException {
        try {
            if(evaluate(quiz)) {
            Quiz quizModel = new Quiz();
            quizModel.setResult(quiz.getResult());
            quizModel.setLOtitle(quiz.getLearningObjectTitle());
            quizModel.setStartTime(quiz.getStartTime());
            quizModel.setEndTime(quiz.getEndTime());
            quizModel.setUsername(quiz.getUsername());
            QuizDAO.addQuiz(quizModel);
            return true;
            } else {
                return false;
            }
        } catch(NullPointerException ae) {System.out.println(ae.getMessage()); return false;}
    }
    
    private boolean evaluate(QuizDto quiz) {
        if(quiz.getEndTime()!=null && quiz.getLearningObjectTitle()!=null && quiz.getResult()>=0 && quiz.getStartTime()!=null && quiz.getUsername()!=null)
            return true;
        else
            return false;
    }
}
