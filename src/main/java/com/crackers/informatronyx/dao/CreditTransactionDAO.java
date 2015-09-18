/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dao;

import com.crackers.informatronyx.config.DatabaseManager;
import com.crackers.informatronyx.models.CreditTransaction;
import java.net.UnknownHostException;
import java.util.List;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import org.springframework.data.mongodb.core.query.Query;

/**
 *
 * @author Ted Ian Osias
 */
public class CreditTransactionDAO {
    
    public static boolean addCreditTransaction(CreditTransaction transaction) throws UnknownHostException
    {
        DatabaseManager.getMongoOpsInstance("database").insert(transaction);
        return exists(transaction);
    }
    
    public static boolean removeCreditTransaction(CreditTransaction transaction) throws UnknownHostException{
        DatabaseManager.getMongoOpsInstance("database").remove(transaction);
        return exists(transaction) == false;
    }
    
    public static CreditTransaction getCreditTransactionById(String id) throws UnknownHostException
    {
        Query query = new Query();
        query.addCriteria(where("transactionID").is(id));
        return DatabaseManager.getMongoOpsInstance("database").findOne(null, CreditTransaction.class);
    }
    
    public static List<CreditTransaction> getAllTransactionByUserId(String userId) throws UnknownHostException{
        Query query = new Query();
        query.addCriteria(where("userID").is(userId));
        return DatabaseManager.getMongoOpsInstance("database").find(query, CreditTransaction.class);
    }
    
    public static boolean exists(CreditTransaction transaction) throws UnknownHostException {
        Query query = new Query();
        query.addCriteria(where("transactionID").is(transaction.getTransactionID()));
        return DatabaseManager.getMongoOpsInstance("database").exists(query, CreditTransaction.class);
    }
    
    
}
