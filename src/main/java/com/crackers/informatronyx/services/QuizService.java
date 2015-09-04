/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.services;

import com.crackers.informatronyx.dao.QuizDAO;
import com.crackers.informatronyx.dto.QuizDto;
import com.crackers.informatronyx.dto.UserDto;
import com.crackers.informatronyx.models.LearningObject;
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
            quizModel.setDate_submitted(quiz.getDate_submitted());
            quizModel.setTotalScore(quiz.getTotalScore());
            quizModel.setUser_id(quiz.getUser_id());
            QuizDAO.addQuiz(quizModel);
            return true;
            }
        } catch(NullPointerException ae) {System.out.println(ae.getMessage());}
         finally{return false;}
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
    
    public List<QuizDto> getQuizResultsOfUserFromSpecificLearningObject(QuizDto quiz) throws UnknownHostException {
        List<QuizDto> quizResultsDto = new ArrayList<QuizDto>();
        try {
            Quiz quizModel = new Quiz();
            quizModel.setLo_id(quiz.getLo_id());
            quizModel.setLo_name(quiz.getLo_name());
            quizModel.setUser_id(quiz.getUser_id());
            quizModel.setUsername(quiz.getUsername());
            quiz.setQuizResults(QuizDAO.getQuizResults(quizModel,"both"));
            for(int i = 0; i < quiz.getQuizResults().size(); i++) {
                quizResultsDto.get(i).setDate_submitted(quiz.getQuizResults().get(i).getDate_submitted());
                quizResultsDto.get(i).setTime_started(quiz.getQuizResults().get(i).getTime_started());
                quizResultsDto.get(i).setTime_finished(quiz.getQuizResults().get(i).getTime_finished());
                quizResultsDto.get(i).setId(quiz.getQuizResults().get(i).getId());
                quizResultsDto.get(i).setLo_id(quiz.getQuizResults().get(i).getLo_id());
                quizResultsDto.get(i).setLo_name(quiz.getQuizResults().get(i).getLo_name());
                quizResultsDto.get(i).setUser_id(quiz.getQuizResults().get(i).getUser_id());
                quizResultsDto.get(i).setUsername(quiz.getQuizResults().get(i).getUsername());
                quizResultsDto.get(i).setScore(quiz.getQuizResults().get(i).getScore());
                quizResultsDto.get(i).setTotalScore(quiz.getQuizResults().get(i).getTotalScore());
            }
        } catch(NullPointerException ae) {System.out.println(ae.getMessage());}
         finally{return quizResultsDto;}
    }
    
    public List<QuizDto> getQuizResultsOfUser(QuizDto quiz) throws UnknownHostException {
        List<QuizDto> quizResultsDto = new ArrayList<QuizDto>();
        try {
            Quiz quizModel = new Quiz();
            quizModel.setLo_id(quiz.getLo_id());
            quizModel.setLo_name(quiz.getLo_name());
            quizModel.setUser_id(quiz.getUser_id());
            quizModel.setUsername(quiz.getUsername());
            quiz.setQuizResults(QuizDAO.getQuizResults(quizModel,""));
            for(int i = 0; i < quiz.getQuizResults().size(); i++) {
                quizResultsDto.get(i).setDate_submitted(quiz.getQuizResults().get(i).getDate_submitted());
                quizResultsDto.get(i).setTime_started(quiz.getQuizResults().get(i).getTime_started());
                quizResultsDto.get(i).setTime_finished(quiz.getQuizResults().get(i).getTime_finished());
                quizResultsDto.get(i).setId(quiz.getQuizResults().get(i).getId());
                quizResultsDto.get(i).setLo_id(quiz.getQuizResults().get(i).getLo_id());
                quizResultsDto.get(i).setLo_name(quiz.getQuizResults().get(i).getLo_name());
                quizResultsDto.get(i).setUser_id(quiz.getQuizResults().get(i).getUser_id());
                quizResultsDto.get(i).setUsername(quiz.getQuizResults().get(i).getUsername());
                quizResultsDto.get(i).setScore(quiz.getQuizResults().get(i).getScore());
                quizResultsDto.get(i).setTotalScore(quiz.getQuizResults().get(i).getTotalScore());
            }
        } catch(NullPointerException ae) {System.out.println(ae.getMessage());}
         finally{return quizResultsDto;}
    }
    
    public List<QuizDto> getQuizResultsOfLearningObject(QuizDto quiz) throws UnknownHostException {
        List<QuizDto> quizResultsDto = new ArrayList<QuizDto>();
        try {
            Quiz quizModel = new Quiz();
            quizModel.setLo_id(quiz.getLo_id());
            quizModel.setLo_name(quiz.getLo_name());
            quizModel.setUser_id(quiz.getUser_id());
            quizModel.setUsername(quiz.getUsername());
            quiz.setQuizResults(QuizDAO.getQuizResults(quizModel, "lo_name"));
            for(int i = 0; i < quiz.getQuizResults().size(); i++) {
                quizResultsDto.get(i).setDate_submitted(quiz.getQuizResults().get(i).getDate_submitted());
                quizResultsDto.get(i).setTime_started(quiz.getQuizResults().get(i).getTime_started());
                quizResultsDto.get(i).setTime_finished(quiz.getQuizResults().get(i).getTime_finished());
                quizResultsDto.get(i).setId(quiz.getQuizResults().get(i).getId());
                quizResultsDto.get(i).setLo_id(quiz.getQuizResults().get(i).getLo_id());
                quizResultsDto.get(i).setLo_name(quiz.getQuizResults().get(i).getLo_name());
                quizResultsDto.get(i).setUser_id(quiz.getQuizResults().get(i).getUser_id());
                quizResultsDto.get(i).setUsername(quiz.getQuizResults().get(i).getUsername());
                quizResultsDto.get(i).setScore(quiz.getQuizResults().get(i).getScore());
                quizResultsDto.get(i).setTotalScore(quiz.getQuizResults().get(i).getTotalScore());
            }
            
        } catch(NullPointerException ae) {System.out.println(ae.getMessage());}
        finally{return quizResultsDto;}
    }
    
    private boolean evaluate(QuizDto quiz) {
        //if(quiz.getEndTime()!=null && quiz.getLearningObjectTitle()!=null && quiz.getResult()>=0 && quiz.getStartTime()!=null && quiz.getUsername()!=null)
            return true;
        //else
        //    return false;
    }
}
