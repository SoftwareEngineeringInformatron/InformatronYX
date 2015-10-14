/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dao;

import java.net.UnknownHostException;
import java.util.List;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import org.springframework.data.mongodb.core.query.Query;
import com.crackers.informatronyx.models.LearningObjectTransaction;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import static org.springframework.data.mongodb.core.query.Query.query;
import org.springframework.stereotype.Repository;


/**
 *
 * @author Ted Ian Osias
 */
@Repository
public class LOTransactionDAO {
    @Autowired MongoOperations transactionMongoOps;
    
    public  boolean recordLOTransaction(LearningObjectTransaction transaction) throws UnknownHostException
    {
        transactionMongoOps.insert(transaction);
        return true;
    }
    public  boolean updateLOTransaction(LearningObjectTransaction transaction) throws UnknownHostException
    {
        if(getLOTransactionByProperty("id",transaction.getId()) != null){
            transactionMongoOps.save(transaction);
            return true;
        }
        return false;
    }
    public  boolean deleteLOTransaction(LearningObjectTransaction transaction) throws UnknownHostException 
    {   
        Logger.getLogger(LOTransactionDAO.class.getName()).log(Level.INFO, 
            transactionMongoOps.remove(getLOTransactionByProperty("id",transaction.getId())).toString()
        );
        return true;
    }
    private  LearningObjectTransaction getLOTransactionByProperty(String property,Object value) throws UnknownHostException{
        Query query = new Query();
        query.addCriteria(where(property).is(value));
        return transactionMongoOps.findOne(query, LearningObjectTransaction.class);
    }
    public  List<LearningObjectTransaction> getAllLOTransactionByUser(String id) 
    {
        Query query = new Query();
        query.addCriteria(where("user_id").is(id));
        return transactionMongoOps.find(query, LearningObjectTransaction.class);
    }
    
    public  boolean exists(String user_id, String lo_id) throws UnknownHostException {
        boolean ok = transactionMongoOps.exists(query(where("user_id").is(user_id).andOperator(where("learningObjectId").is(lo_id))), LearningObjectTransaction.class);
        return ok;
    }
}
