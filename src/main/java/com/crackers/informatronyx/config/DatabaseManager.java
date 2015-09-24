/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.config;


import com.mongodb.Mongo;
import java.net.UnknownHostException;
import java.util.List;
import org.springframework.data.mongodb.core.MongoClientFactoryBean;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;

/**
 *
 * @author Ted Ian Osias
 */
public class DatabaseManager {
    private static MongoOperations instance = null;
    private static Mongo instanceMongo = null;
    public static MongoOperations getMongoOpsInstance(String databaseName) throws UnknownHostException{
         if(instance==null){
             MongoClientFactoryBean b = new MongoClientFactoryBean();
             b.setSingleton(false);
             b.setHost(AppConfig.mongodb_host);
             b.setPort(AppConfig.mongodb_port);
             try {
                instanceMongo = b.getObject();//new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port);
                List<String> str = instanceMongo.getDatabaseNames();
                instance = new MongoTemplate(instanceMongo,databaseName);
             } catch (Exception ex) {
                 ex.printStackTrace(System.out);
             }
         }
         
        return instance;
    }
}
