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
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;

/**
 *
 * @author Andrew Paul Mago
 */
public class QuizDAO {
    
    public static Quiz getQuiz(Quiz quiz) throws UnknownHostException {
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"database");
        Quiz q = null;
        q = mongoOps.findOne(query(where("username").is(q.getUsername()).orOperator(where("endTime").is(q.getEndTime()))), Quiz.class);
        return q;
    }
    
    public static List<Quiz> getQuizResultsByLearningObject() throws UnknownHostException {
        return null;
    }
    
    public static List<Quiz> getQuizResultsByUser() throws UnknownHostException {
        return null;
    }
    
    public static List<Quiz> getQuizResults() throws UnknownHostException {
        return null;
    }
}
