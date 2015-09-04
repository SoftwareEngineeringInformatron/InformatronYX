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
import java.util.ArrayList;
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
            quizModel.setScore(quiz.getScore());
            quizModel.setLo_name(quiz.getLo_name());
            quizModel.setLo_id(quiz.getLo_id());
            quizModel.setId(quiz.getId());
            quizModel.setTime_started(quiz.getTime_started());
            quizModel.setTime_finished(quiz.getTime_finished());
            quizModel.setUsername(quiz.getUsername());
            quizModel.setDate_Submitted(quiz.getDate_submitted());
            quizModel.setTotalScore(quiz.getTotalScore());
            quizModel.setUser_id(quiz.getUser_id());
            QuizDAO.addQuiz(quizModel);
            return true;
            }
        } catch(NullPointerException ae) {System.out.println(ae.getMessage());}
         finally{return false;}
    }
    
    public boolean delete(QuizDto quiz) throws UnknownHostException {
        try {
            if(evaluate(quiz)) {
                Quiz quizModel = new Quiz();
                quizModel.setScore(quiz.getScore());
            quizModel.setLo_name(quiz.getLo_name());
            quizModel.setLo_id(quiz.getLo_id());
            quizModel.setId(quiz.getId());
            quizModel.setTime_started(quiz.getTime_started());
            quizModel.setTime_finished(quiz.getTime_finished());
            quizModel.setUsername(quiz.getUsername());
            quizModel.setDate_Submitted(quiz.getDate_submitted());
            quizModel.setTotalScore(quiz.getTotalScore());
            quizModel.setUser_id(quiz.getUser_id());
            QuizDAO.deleteQuiz(quizModel);
            return true;
            }
        } catch(NullPointerException ae) {System.out.println(ae.getMessage());}
         finally{return false;}
    }
    
    public boolean edit(QuizDto quiz) throws UnknownHostException {
        try {
            if(evaluate(quiz)) {
                Quiz quizModel = new Quiz();
                quizModel.setScore(quiz.getScore());
            quizModel.setLo_name(quiz.getLo_name());
            quizModel.setLo_id(quiz.getLo_id());
            quizModel.setId(quiz.getId());
            quizModel.setTime_started(quiz.getTime_started());
            quizModel.setTime_finished(quiz.getTime_finished());
            quizModel.setUsername(quiz.getUsername());
            quizModel.setDate_Submitted(quiz.getDate_submitted());
            quizModel.setTotalScore(quiz.getTotalScore());
            quizModel.setUser_id(quiz.getUser_id());
            QuizDAO.editQuiz(quizModel);
            return true;
            }
        } catch(NullPointerException ae) {System.out.println(ae.getMessage());}
         finally{return false;}
    }
    
    public List<Quiz> getQuiz(QuizDto quiz) throws UnknownHostException {
        try {
            List<Quiz> quizList = new ArrayList<Quiz>();
            Quiz quizModel = new Quiz();
            
        } catch(NullPointerException ae) {System.out.println(ae.getMessage());}
         finally{return null;}
    }
    
    private boolean evaluate(QuizDto quiz) {
        //if(quiz.getEndTime()!=null && quiz.getLearningObjectTitle()!=null && quiz.getResult()>=0 && quiz.getStartTime()!=null && quiz.getUsername()!=null)
            return true;
        //else
        //    return false;
    }
}
