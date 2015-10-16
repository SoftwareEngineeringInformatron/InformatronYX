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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author User
 */
@Service
public class QuizService {
    @Autowired QuizDAO dao;
    public boolean record(QuizDto quiz) throws UnknownHostException {
        //try {
            if(evaluate(quiz)) {
            Quiz quizModel = new Quiz();
            quizModel.setScore(quiz.getScore());
            quizModel.setLo_name(quiz.getLo_name());
            quizModel.setLo_id(quiz.getLo_id()); 
            quizModel.setLo_subject(quiz.getLo_subject());
            quizModel.setId(quiz.getId());
            quizModel.setTime_started(quiz.getTime_started());
            quizModel.setTime_finished(quiz.getTime_finished());
            quizModel.setUsername(quiz.getUsername());
            quizModel.setDate_submitted(quiz.getTime_finished());
            quizModel.setTotalScore(quiz.getTotalScore());
            quizModel.setUser_id(quiz.getUser_id());
            dao.addQuiz(quizModel);
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
            dao.deleteQuiz(quizModel);
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
    public List<QuizDto> getQuizResults(QuizDto quiz, String condition) throws UnknownHostException {
        List<QuizDto> quizResultsDto = new ArrayList<QuizDto>();
        try {
            Quiz quizModel = new Quiz();
            if(condition.isEmpty()) {
                quiz.setQuizResults(dao.getQuizResults(quizModel,""));
                //System.out.println(quiz.getQuizResults().get(0).getLo_name());
            } else {
                quizModel.setLo_id(quiz.getLo_id());
                quizModel.setLo_name(quiz.getLo_name());
                quizModel.setLo_subject(quiz.getLo_subject());
                quizModel.setUser_id(quiz.getUser_id());
                quizModel.setUsername(quiz.getUsername());
            if(condition.contentEquals("userSpecific"))
                quiz.setQuizResults(dao.getQuizResults(quizModel,"both"));
            else if(condition.contentEquals("LOSpecific"))
                quiz.setQuizResults(dao.getQuizResults(quizModel,"lo_name"));
            else if(condition.contentEquals("NASpecific"))
                quiz.setQuizResults(dao.getQuizResults(quizModel,"user"));
            else
                return null;
            }
            
            QuizDto quizDto;
            for(int i = 0; i < quiz.getQuizResults().size(); i++) {
                quizDto = new QuizDto();
                quizDto = quiz.getsetQuiz(quiz.getQuizResults().get(i));
                quizResultsDto.add(quizDto);
            }
        } catch(NullPointerException ae) {System.out.println("Service Error!"); ae.printStackTrace();}
         finally{return quizResultsDto;}
    }
    
    private boolean evaluate(QuizDto quiz) {
        if(quiz.getTime_finished()!=null && quiz.getLo_id()!=null && quiz.getScore()>=0 && quiz.getTime_started()!=null && quiz.getUser_id()!=null)
            return true;
        else
            return false;
    }
}
