/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.pageControllers;

import com.crackers.informatronyx.models.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Ted Ian Osias
 */
@Controller
public class IndexController {
    
    @RequestMapping("/home")
    public ModelAndView accessIndex() {
        return new ModelAndView("index");
    }  
    @RequestMapping("/test")
    public ModelAndView accessTestPage() {
        return new ModelAndView("test");
    }
    @RequestMapping("/testdownloadrecord")
    public ModelAndView accessTestDownloadRecordPage() {
        return new ModelAndView("testdownloadrecord");
    }
    @RequestMapping("/scripts")
    public ModelAndView scriptsPage() {
        return new ModelAndView("scripts");
    }
    @RequestMapping("/main")
    public ModelAndView mainPage() {
        return new ModelAndView("main");
    }
    @RequestMapping("/quiz")
    public ModelAndView quizPage() {
        return new ModelAndView("quiz");
    }
    @RequestMapping("/super_admin")
    public ModelAndView superAdminPage() {
        return new ModelAndView("superadmin_view");
    }
    @RequestMapping("/admin_meter")
    public ModelAndView adminMeterPage() {
        return new ModelAndView("adminmeter_view");
    }
    @RequestMapping("/admin")
    public ModelAndView adminApprovalPage() {
        return new ModelAndView("admin_view");
    }
    @RequestMapping("/user_meter")
    public ModelAndView userMeterPage() {
        return new ModelAndView("usermeter_view");
    }
    @RequestMapping("/history")
    public ModelAndView userHistoryPage() {
        return new ModelAndView("user_history");
    }
    
    @RequestMapping("/setting")
    public ModelAndView settingPage() {
        return new ModelAndView("settings");
    }
    
    @RequestMapping("/admin_history")
    public ModelAndView adminHistoryPage() {
        return new ModelAndView("admin_history");
    }
    
    @RequestMapping("/add_Quiz_Result")
    public ModelAndView addQuizResultPage() {
        return new ModelAndView("addQuizResult");
    }
    
    @RequestMapping("/download")
    public ModelAndView downloadPage() {
        return new ModelAndView("download_view");
    }
    
    @RequestMapping("/evaluation")
    public ModelAndView evaluationPage() {
        return new ModelAndView("evaluation");
    }
    
    @RequestMapping("/search_advanced")
    public ModelAndView advancedSearch() {
        return new ModelAndView("advanced_search");
    }
    @RequestMapping("/univ_add")
    public ModelAndView accessUniversalAddPage() {
        return new ModelAndView("universalAdd");
    }
}

