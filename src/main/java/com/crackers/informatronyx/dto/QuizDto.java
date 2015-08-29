/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dto;

import com.crackers.informatronyx.models.Quiz;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author User
 */
public class QuizDto {
    
    int result;
    String learningObjectTitle;
    String username;
    Date startTime;
    Date endTime;
    List<Quiz> quizResults;
    List<String> errorList;
    
    public QuizDto() {
        errorList = new ArrayList<String>();
    }

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String getLearningObjectTitle() {
        return learningObjectTitle;
    }

    public void setLearningObjectTitle(String learningObjectTitle) {
        this.learningObjectTitle = learningObjectTitle;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public List<Quiz> getQuizResults() {
        return quizResults;
    }

    public void setQuizResults(List<Quiz> quizResults) {
        this.quizResults = quizResults;
    }

    public List<String> getErrorList() {
        return errorList;
    }

    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }
}
