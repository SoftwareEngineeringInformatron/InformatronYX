/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dao;

import com.crackers.informatronyx.models.CreditTransaction;
import java.net.UnknownHostException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Ted Ian Osias
 */
@Repository
public class CreditTransactionDAO {
    @Autowired MongoOperations transactionMongoOps;
    
    public  boolean addCreditTransaction(CreditTransaction transaction) throws UnknownHostException
    {
        transactionMongoOps.insert(transaction);
        return exists(transaction);
    }
    
    public  boolean removeCreditTransaction(CreditTransaction transaction) throws UnknownHostException{
        transactionMongoOps.remove(transaction);
        return exists(transaction) == false;
    }
    
    public  boolean editCreditTransaction(CreditTransaction transaction) throws UnknownHostException{
        transactionMongoOps.save(transaction);
        return true;
    }
    
    public  CreditTransaction getCreditTransactionById(String id) throws UnknownHostException
    {
        Query query = new Query();
        query.addCriteria(where("id").is(id));
        return transactionMongoOps.findOne(query, CreditTransaction.class);
    }
    
    public  List<CreditTransaction> getAllTransactionByUserId(String userId) throws UnknownHostException{
        Query query = new Query();
        query.addCriteria(where("user_Id").is(userId));
        return transactionMongoOps.find(query, CreditTransaction.class);
    }
    
    public  boolean approveTransaction(String transactionID) throws UnknownHostException{
        CreditTransaction trans = getCreditTransactionById(transactionID);
        trans.setFinished(true);
        editCreditTransaction(trans);
        return true;
    }
    
    public  boolean exists(CreditTransaction transaction) throws UnknownHostException {
        Query query = new Query();
        query.addCriteria(where("id").is(transaction.getId()));
        return transactionMongoOps.exists(query, CreditTransaction.class);
    }
    public  boolean existsByOfficialReciept(String OR) throws UnknownHostException{
        return transactionMongoOps.exists(generateQuery("officialReceipt",OR), CreditTransaction.class);
    }
    private  Query generateQuery(String property,Object value){
        Query query = new Query();
        query.addCriteria(where(property).is(value));
        return query;
    }
    
    
}
