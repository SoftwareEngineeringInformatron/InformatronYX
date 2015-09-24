/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.controllers;

import com.crackers.informatronyx.dto.CreditTransactionDto;
import com.crackers.informatronyx.dto.LOTransactionDto;
import com.crackers.informatronyx.dto.UserDto;
import com.crackers.informatronyx.models.Transaction;
import com.crackers.informatronyx.services.TransactionService;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Ted Ian Osias
 */
@RestController
@RequestMapping("/transact")
public class TransactionController {
    
    @RequestMapping(value = "/credit/add", method = RequestMethod.POST)
    public String addCreditsToUser(@RequestBody CreditTransactionDto trans) throws JSONException { 
        JSONObject json = new JSONObject();
        List<String> errorList = new ArrayList();
        if(trans!=null){
            try {
                TransactionService service = new TransactionService();
                json.put("result", service.addCreditsToUser(trans));
            } catch (Exception ex) {
                errorList.add(ex.getMessage());
            }
        }
        json.put("errorList",errorList); 
        return json.toString();
    }
    @RequestMapping(value = "/credit/remove", method = RequestMethod.POST)
    public boolean removeCreditsToUser(@RequestBody CreditTransactionDto trans) throws UnknownHostException{ 
        if(trans!=null){
            TransactionService service = new TransactionService();
            return service.removeCreditsFromUser(trans);
        }
        return false;
    }
    
    @RequestMapping(value = "/approve/credit", method = RequestMethod.POST)
    public boolean approveCreditTransaction(@RequestBody  CreditTransactionDto trans) throws UnknownHostException{
        
        if(trans!=null){
            TransactionService service = new TransactionService();
            return service.approveCreditTransaction(trans);
        }
        return false;
    }
    @RequestMapping(value = "/cancel/credit", method = RequestMethod.POST)
    public boolean removeCreditTransaction(@RequestBody  CreditTransactionDto trans) throws UnknownHostException{
        if(trans!=null){
            TransactionService service = new TransactionService();
            return service.removeCreditTransaction(trans);
        }
        return false;
    }
    @RequestMapping(value = "/LO/record", method = RequestMethod.POST)
    public boolean recordLOPurchase(@RequestBody  LOTransactionDto trans){
        if(trans!=null){}
        return false;
    }
    @RequestMapping(value = "/history/LO", method = RequestMethod.POST)
    public List<LOTransactionDto> getLOTransactionHistory(){
        return null;
    }
    @RequestMapping(value = "/history/credit", method = RequestMethod.POST)
    public List<CreditTransactionDto> getCreditTransactionHistory(@RequestBody UserDto dto) throws UnknownHostException{
        if(dto!=null)
            return (new TransactionService()).getCreditTransactionHistory(dto);
        else return null;
    }
}