/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.controllers;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.MongoFactoryBean;

/**
 *
 * @author Ted Ian Osias
 */
@Configuration
public class AppConfig {

    /*
     * Factory bean that creates the com.mongodb.Mongo instance
     */
     public @Bean MongoFactoryBean mongo() {
          MongoFactoryBean mongo = new MongoFactoryBean();
          mongo.setHost("localhost");
          System.out.println("Mongodb set to :Localhost");
          return mongo;
     }

}
