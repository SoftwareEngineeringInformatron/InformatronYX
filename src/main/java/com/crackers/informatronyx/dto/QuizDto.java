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
    
    String id;
    String lo_id;
    String lo_name;
    String lo_subject;
    int score;
    int totalScore;
    Date date_submitted;
    Date time_started;
    Date time_finished;
    String username;
    int user_id;
    List<Quiz> quizResults;
    List<String> errorList;
    
    public QuizDto() {
        errorList = new ArrayList<String>();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLo_id() {
        return lo_id;
    }

    public void setLo_id(String lo_id) {
        this.lo_id = lo_id;
    }

    public String getLo_name() {
        return lo_name;
    }

    public void setLo_name(String lo_name) {
        this.lo_name = lo_name;
    }

    public String getLo_subject() {
        return lo_subject;
    }

    public void setLo_subject(String lo_subject) {
        this.lo_subject = lo_subject;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(int totalScore) {
        this.totalScore = totalScore;
    }

    public Date getDate_submitted() {
        return date_submitted;
    }

    public void setDate_submitted(Date date_submitted) {
        this.date_submitted = date_submitted;
    }

    public Date getTime_started() {
        return time_started;
    }

    public void setTime_started(Date time_started) {
        this.time_started = time_started;
    }

    public Date getTime_finished() {
        return time_finished;
    }

    public void setTime_finished(Date time_finished) {
        this.time_finished = time_finished;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setQuizResults(List<Quiz> quizResults) {
        this.quizResults = quizResults;
    }
    
    public List<Quiz> getQuizResults() {
        return quizResults;
    }

    public List<String> getErrorList() {
        return errorList;
    }

    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }
}
