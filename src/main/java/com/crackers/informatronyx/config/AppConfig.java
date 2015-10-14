/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.config;

import com.mongodb.Mongo;
import com.mongodb.MongoClientOptions;
import com.mongodb.MongoClientOptions.Builder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.MongoClientFactoryBean;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;

/**
 *
 * @author Ted Ian Osias
 */
@Configuration
public class AppConfig {

    /*
     * Factory bean that creates the com.mongodb.Mongo instance
     */
    public static String mongodb_host = "localhost";
    public static int mongodb_port = 27017;
    public static String DATABASE_TRANSACTION = "transaction";
    public static String DATABASE_USER = "user";
    public static String LOOP_DOWNLOAD_LE = "http://localhost:8080/InformatronYX/store/site_js/page/admin.js";
    
    
    // MONGODB CONFIGURATION
    public static int connectionsPerHost = 40;
    public static int connectionTimeOut = 1000;
    @Bean
    public Mongo mongo() throws Exception{
             MongoClientFactoryBean b = new MongoClientFactoryBean();
             b.setSingleton(false);
             b.setHost(AppConfig.mongodb_host);
             b.setPort(AppConfig.mongodb_port);
             Builder builder = MongoClientOptions.builder();
             builder.connectionsPerHost(AppConfig.connectionsPerHost);
             builder.connectTimeout(AppConfig.connectionTimeOut);
             b.setMongoClientOptions(builder.build());
             return b.getObject();
    }
    
    @Bean
    public MongoOperations userMongoOps() throws Exception{
        return new MongoTemplate(mongo(),AppConfig.DATABASE_USER);
        
    }
    
    @Bean
    public MongoOperations transactionMongoOps() throws Exception{
        return new MongoTemplate(mongo(),AppConfig.DATABASE_TRANSACTION);
    }
}
