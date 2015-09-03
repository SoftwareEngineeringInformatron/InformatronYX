/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dao;

import com.crackers.informatronyx.config.AppConfig;
import com.crackers.informatronyx.models.Quiz;
import com.mongodb.Mongo;
import java.net.UnknownHostException;
import java.util.List;
import javax.swing.JOptionPane;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;
import org.springframework.data.mongodb.core.query.Update;

/**
 *
 * @author Andrew Paul Mago
 */
public class QuizDAO {
    
    public static boolean addQuiz(Quiz quiz) throws UnknownHostException {
        try {
         MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"quiz");
         mongoOps.insert(quiz);
         return true;
         
        } catch (NullPointerException ae) {System.out.println(ae.getMessage()); return false;}   
    }
    
    public static boolean editQuiz(Quiz quiz) throws UnknownHostException {
        try {
         MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"quiz");
         Update updateQuiz = new Update();
         updateQuiz.set("result",quiz.getScore());
         updateQuiz.set("startTime", quiz.getTime_started());
         updateQuiz.set("endTime",quiz.getTime_finished());
         mongoOps.findAndModify(query(where("username").is(quiz.getUsername()).andOperator(where("lo_name").is(quiz.getLo_name()))),updateQuiz,Quiz.class);
         return true;
         
        } catch (NullPointerException ae) {System.out.println(ae.getMessage()); return false;}
    }   
    
    public static boolean deleteQuiz(Quiz quiz) throws UnknownHostException {
        try {
         MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"quiz");
         mongoOps.remove(query(where("username").is(quiz.getUsername()).andOperator(where("lo_name").is(quiz.getLo_name()))), Quiz.class);
         return true;
         
        } catch (NullPointerException ae) {System.out.println(ae.getMessage()); return false;}
    }
    
    public static Quiz getQuiz(Quiz quiz) throws UnknownHostException {
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"quiz");
        Quiz q = null;
        q = mongoOps.findOne(query(where("username").is(quiz.getUsername()).orOperator((where("time_started").is(quiz.getTime_started()).andOperator(where("time_finished").is(quiz.getTime_finished()))))), Quiz.class);
        return q;
    }
    
    public static List<Quiz> getQuizResults() throws UnknownHostException {
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"quiz");
        return mongoOps.findAll(Quiz.class);
    }
    
    public static List<Quiz> getQuizResults(Quiz quiz,String filter) throws UnknownHostException {
        try {
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"quiz");
        if(filter.contentEquals("learningObjectTitle"))
        return mongoOps.find(query(where("lo_name").is(quiz.getLo_name())), Quiz.class);
        else
        return mongoOps.find(query(where("username").is(quiz.getUsername())), Quiz.class);
        
        } catch(NullPointerException ae) {System.out.println(ae.getMessage()); return null;}
    }
    
    /*
    public static void main(String[] args) throws Exception {   
        Quiz q = new Quiz();
        q.setResult(20);
        q.setUsername("mago");
        q.setLOtitle("TestLO3");
        q.setStartTime(new java.util.Date(115,3,15));
        q.setEndTime(new java.util.Date(115,3,15));
        JOptionPane.showMessageDialog(null, q.toString());
        JOptionPane.showMessageDialog(null, QuizDAO.addQuiz(q));
        JOptionPane.showMessageDialog(null, QuizDAO.deleteQuiz(q));
        JOptionPane.showMessageDialog(null, QuizDAO.getQuiz(q).toString());
        JOptionPane.showMessageDialog(null, QuizDAO.editQuiz(q));
        System.out.println(QuizDAO.getQuizResults());
        System.out.println(QuizDAO.getQuizResults(q, "learningObjectTitle"));
    }
    */
}
