/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.controllers;

<<<<<<< HEAD
import com.crackers.informatronyx.dto.QuizDto;
=======
import com.crackers.informatronyx.models.LearningObject;
>>>>>>> origin/master
import com.crackers.informatronyx.models.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 *
 * @author Ted Ian Osias
 */
@RestController
@EnableWebMvc
public class TestClass {
    
    @RequestMapping("/test")
    public User test()
    {
        return new User();
    }
<<<<<<< HEAD
    
    @RequestMapping("/testQ")
    public QuizDto quiz() {
        QuizDto quiz = new QuizDto();
        quiz.setUsername("");
        quiz.setLo_name("");
        return quiz;
    }
    
=======
>>>>>>> origin/master
}
