/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.services;

import com.crackers.informatronyx.dao.CreditTransactionDAO;
import com.crackers.informatronyx.dao.LOTransactionDAO;
import com.crackers.informatronyx.dao.LearningObjectDAO;
import com.crackers.informatronyx.dao.UserDAO;
import com.crackers.informatronyx.dto.CreditTransactionDto;
import com.crackers.informatronyx.dto.LOTransactionDto;
import com.crackers.informatronyx.dto.UserDto;
import com.crackers.informatronyx.models.CreditTransaction;
import com.crackers.informatronyx.models.LearningObjectTransaction;
import com.crackers.informatronyx.models.User;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Ted Ian Osias
 */
@Service
public class TransactionService {
    @Autowired UserDAO userDAO;
    @Autowired LOTransactionDAO lOTransactionDAO;
    @Autowired CreditTransactionDAO creditTransactionDAO;
    @Autowired LearningObjectDAO loDao;
    public boolean addCreditsToUser(CreditTransactionDto trans) throws UnknownHostException, Exception{ 
        
        CreditTransaction transaction = new CreditTransaction();
        User userModel = null;
        userModel = userDAO.getUser(trans.getU_ID());
        if(userModel == null)
            return false;
        transaction.setUser_Id(trans.getU_ID());
        transaction.setAmount(trans.getAmnt());
        transaction.setDateOfTransaction(new Date());
        transaction.setFinished(false);
        if(creditTransactionDAO.existsByOfficialReciept(trans.getOr()))
            throw new Exception("Offcial Recepit has already been registered");
        transaction.setOfficialReceipt(trans.getOr());
        //transaction.setApproveBy(trans.getAppBy());
        creditTransactionDAO.addCreditTransaction(transaction);
        return true;
    }
    public boolean approveCreditTransaction(CreditTransactionDto trans) throws UnknownHostException{
        boolean ok = false;
        CreditTransaction obj = creditTransactionDAO.getCreditTransactionById(trans.getId());
        obj.setApproveBy(trans.getAppBy());
        obj.setFinished(true);
        User user = userDAO.getUser(obj.getUser_Id());
        user.setCredits(user.getCredits() + obj.getAmount());
        if(userDAO.editUser(user))
            ok = creditTransactionDAO.editCreditTransaction(obj);
        return ok;
    }
    public boolean removeCreditsFromUser(CreditTransactionDto dto) throws UnknownHostException{ 
       boolean ok = false;
       User userModel = userDAO.getUser(dto.getU_ID());
       //User approvedBy = userDAO.getUser(dto.getAppBy());
        userModel.setCredits(userModel.getCredits() - dto.getAmnt());
        CreditTransaction transaction = new CreditTransaction();
        transaction.setUser_Id(userModel.getId());
        transaction.setAmount(-1*dto.getAmnt());
        transaction.setDateOfTransaction(new Date());
        transaction.setFinished(true);
        //transaction.setOfficialReceipt("Removed By:" + approvedBy.getUsername());
       // transaction.setApproveBy(approvedBy.getId());
        if(creditTransactionDAO.addCreditTransaction(transaction)){
            userDAO.editUser(userModel);
            ok = true;
        }
       
       return ok;
    }
    public boolean recordLOPurchase(LOTransactionDto transaction) throws UnknownHostException{
        if(!loDao.exists(transaction.getU_Id()))
        {
            System.out.println(transaction.getU_Id());
            System.out.println(transaction.getLo_id());
            if(!lOTransactionDAO.exists(transaction.getU_Id(), transaction.getLo_id())) {
            LearningObjectTransaction transModel = new LearningObjectTransaction();
            transModel.setAmount(transaction.getAmount());
            transModel.setDateOfTransaction(new Date());
            transModel.setFinished(false);
            transModel.setLearningObjectId(transaction.getLo_id());
            transModel.setUser_id(transaction.getU_Id());
            
            if(lOTransactionDAO.recordLOTransaction(transModel)){
                User user = userDAO.getUser(transModel.getUser_id());
                user.getLiableLearningObjects()
                        .add(loDao.getLearningObjectById(transModel.getLearningObjectId()));
                userDAO.editUser(user);
            }
            return true;
            } else {
                return false;
            }
        }
        else
            return false;
    }
    public List<LOTransactionDto> getLOTransactionHistory(UserDto user){
        List<LearningObjectTransaction> trans = lOTransactionDAO.getAllLOTransactionByUser(user.getId());
        List<LOTransactionDto> dtos = new ArrayList<>();
        for(LearningObjectTransaction transaction : trans)
        {
            LOTransactionDto dto = new LOTransactionDto();
            dto.setData(transaction);
            dtos.add(dto);
        }
        return dtos;
    }
    public List<CreditTransactionDto> getCreditTransactionHistory(UserDto user) throws UnknownHostException{
        List<CreditTransaction> trans = creditTransactionDAO.getAllTransactionByUserId(user.getId());
        List<CreditTransactionDto> dtos = new ArrayList<>();
        for(CreditTransaction transaction : trans)
        {
            CreditTransactionDto dto = new CreditTransactionDto();
            dto.setData(transaction);
            dtos.add(dto);
        }
        return dtos;
    }

    public boolean removeCreditTransaction(CreditTransactionDto trans) throws UnknownHostException {
        CreditTransaction model = new CreditTransaction();
        model.setId(trans.getId());
        return creditTransactionDAO.removeCreditTransaction(model);
    }
    
    
}
