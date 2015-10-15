/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.controllers;


import com.crackers.informatronyx.config.AppConfig;
import com.crackers.informatronyx.dto.UserDto;
import com.crackers.informatronyx.models.LearningElement;
import com.crackers.informatronyx.models.LearningObject;
import com.crackers.informatronyx.services.UserService;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.client.ClientHttpRequest;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




/**
 *
 * @author ian
 */
@Controller
@RequestMapping("/connect")
public class ConnectionController {
    @Autowired UserService service;
    @RequestMapping(value= "/download/le/{user_id}/{lo_id}/{le_id}", method = RequestMethod.GET)
    public void download(@PathVariable("user_id") String userId, 
                         @PathVariable("le_id") String leId,
                         @PathVariable("lo_id") String loId,
                         HttpServletResponse response) throws URISyntaxException, IOException{
        UserDto user = new UserDto();
        user.setId(userId);
        user = service.getUserInfo(user);
        if(user == null)
            response.sendError(404, "User does not exist.");
        else
        {
            LearningObject lo = null;
            for(LearningObject obj : user.getLiableLearningObjects())
                if(obj.getId().equals(loId)){
                    lo = obj; break;
                }
            if(lo==null)
                response.sendError(404, "User "+user.getUsername()+": Unauthorized Access");
            else{
                LearningElement le = lo.getLearningElement(leId);
                if(le==null)
                    response.sendError(404, "Learning Element does not exist.");
                else
                    sendLE(le.getId()+le.getFileExtension(),response);
            }
        }
            
    }
    @RequestMapping(value= "/download/test/{le_id}", method = RequestMethod.GET)
    public void getLe(@PathVariable("le_id") String leId,HttpServletResponse response){
        sendLE(leId,response);
    }
    private void sendLE(String leId,HttpServletResponse response){
            SimpleClientHttpRequestFactory requestfactory = new SimpleClientHttpRequestFactory();
        ClientHttpResponse loopResponse;
        try {
            ClientHttpRequest createRequest = requestfactory.createRequest(new URI(AppConfig.LOOP_DOWNLOAD_LE), HttpMethod.GET);
            loopResponse = createRequest.execute();
            try (InputStream fileStream = loopResponse.getBody()) {
                String headerKey = "Content-Disposition";
                String headerValue = String.format("attachment; filename=\"%s\"", leId);
                response.setHeader(headerKey, headerValue);
                IOUtils.copy(fileStream,response.getOutputStream());
                response.getOutputStream().close();
            }
            
        } catch (IOException | URISyntaxException ex) {
            Logger.getLogger(ConnectionController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
