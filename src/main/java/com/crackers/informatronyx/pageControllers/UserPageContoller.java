/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.pageControllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Ted Ian Osias
 */
@Controller
public class UserPageContoller {
    
    @RequestMapping("/login_signup")
    public ModelAndView accessIndex() {
        return new ModelAndView("login_signup");
    }  
}
