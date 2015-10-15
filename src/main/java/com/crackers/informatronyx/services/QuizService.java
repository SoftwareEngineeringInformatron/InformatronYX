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
        //try {
            if(evaluate(quiz)) {
            Quiz quizModel = new Quiz();
            quizModel.setScore(quiz.getScore());
            quizModel.setLo_name(quiz.getLo_name());
            //quizModel.setLo_id(quiz.getLo_id()); 
            //quizModel.setLo_subject(quiz.getLo_subject());
            //quizModel.setId(quiz.getId());
            quizModel.setTime_started(quiz.getTime_started());
            quizModel.setTime_finished(quiz.getTime_finished());
            quizModel.setUsername(quiz.getUsername());
            quizModel.setDate_submitted(quiz.getTime_finished());
            //quizModel.setTotalScore(quiz.getTotalScore());
            quizModel.setUser_id(quiz.getUser_id());
            QuizDAO.addQuiz(quizModel);
            return true;
            } else
                return false;
        //} catch(NullPointerException ae) {System.out.println(ae.getMessage());}
        // finally{return false;}
    }
    
    /*
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
            quizModel.setDate_submitted(quiz.getDate_submitted());
            quizModel.setTotalScore(quiz.getTotalScore());
            quizModel.setUser_id(quiz.getUser_id());
            QuizDAO.deleteQuiz(quizModel);
            return true;
            }
        } catch(NullPointerException ae) {System.out.println(ae.getMessage());}
         finally{return false;}
    }
    */
    
    /*
    ** @param - condition
                        - userSpecific = specific LO from specific user
                        - LOSpecific = specific LO from all users
                        - NASpecific = all LOs from specific user
                        - empty/null/"" = all LOs from all users
    */
    public List<QuizDto> getQuizResults(QuizDto quiz1, String condition) throws UnknownHostException {
        List<QuizDto> quizResultsDto = new ArrayList<QuizDto>();
        QuizDto quiz = new QuizDto();
        try {
            Quiz quizModel = new Quiz();
            if(condition.isEmpty()) {
                quiz.setQuizResults(QuizDAO.getQuizResults(quizModel,""));
                //System.out.println(quiz.getQuizResults().get(0).getLo_name());
            } else {
                quizModel.setLo_id(quiz1.getLo_id());
                quizModel.setLo_name(quiz1.getLo_name());
                quizModel.setLo_subject(quiz1.getLo_subject());
                quizModel.setUser_id(quiz1.getUser_id());
                quizModel.setUsername(quiz1.getUsername());
            if(condition.contentEquals("userSpecific"))
                quiz.setQuizResults(QuizDAO.getQuizResults(quizModel,"both"));
            else if(condition.contentEquals("LOSpecific"))
                quiz.setQuizResults(QuizDAO.getQuizResults(quizModel,"lo_name"));
            else if(condition.contentEquals("NASpecific"))
                quiz.setQuizResults(QuizDAO.getQuizResults(quizModel,"user"));
            else
                return null;
            }
            
            QuizDto quizDto;
            for(int i = 0; i < quiz.getQuizResults().size(); i++) {
                quizDto = new QuizDto();
                quizResultsDto.add(quizDto.getsetQuiz(quiz.getQuizResults().get(i)));
                
            }
        } catch(NullPointerException ae) {System.out.println("Service Error!"); ae.printStackTrace();}
         finally{return quizResultsDto;}
    }
    
    private boolean evaluate(QuizDto quiz) {
        //if(quiz.getEndTime()!=null && quiz.getLearningObjectTitle()!=null && quiz.getResult()>=0 && quiz.getStartTime()!=null && quiz.getUsername()!=null)
            return true;
        //else
        //    return false;
    }
}
