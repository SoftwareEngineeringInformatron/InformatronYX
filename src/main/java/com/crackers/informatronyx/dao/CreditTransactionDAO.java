/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dao;

import com.crackers.informatronyx.config.AppConfig;
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
        DatabaseManager.getMongoOpsInstance(AppConfig.DATABASE_TRANSACTION).insert(transaction);
        return exists(transaction);
    }
    
    public static boolean removeCreditTransaction(CreditTransaction transaction) throws UnknownHostException{
        DatabaseManager.getMongoOpsInstance(AppConfig.DATABASE_TRANSACTION).remove(transaction);
        return exists(transaction) == false;
    }
    
    public static boolean editCreditTransaction(CreditTransaction transaction) throws UnknownHostException{
        DatabaseManager.getMongoOpsInstance(AppConfig.DATABASE_TRANSACTION).save(transaction);
        return true;
    }
    
    public static CreditTransaction getCreditTransactionById(String id) throws UnknownHostException
    {
        Query query = new Query();
        query.addCriteria(where("id").is(id));
        return DatabaseManager.getMongoOpsInstance(AppConfig.DATABASE_TRANSACTION).findOne(query, CreditTransaction.class);
    }
    
    public static List<CreditTransaction> getAllTransactionByUserId(String userId) throws UnknownHostException{
        Query query = new Query();
        query.addCriteria(where("user_Id").is(userId));
        return DatabaseManager.getMongoOpsInstance(AppConfig.DATABASE_TRANSACTION).find(query, CreditTransaction.class);
    }
    
    public static boolean approveTransaction(String transactionID) throws UnknownHostException{
        CreditTransaction trans = CreditTransactionDAO.getCreditTransactionById(transactionID);
        trans.setFinished(true);
        editCreditTransaction(trans);
        return true;
    }
    
    public static boolean exists(CreditTransaction transaction) throws UnknownHostException {
        Query query = new Query();
        query.addCriteria(where("id").is(transaction.getId()));
        return DatabaseManager.getMongoOpsInstance(AppConfig.DATABASE_TRANSACTION).exists(query, CreditTransaction.class);
    }
    public static boolean existsByOfficialReciept(String OR) throws UnknownHostException{
        return DatabaseManager.getMongoOpsInstance(AppConfig.DATABASE_TRANSACTION).exists(generateQuery("officialReceipt",OR), CreditTransaction.class);
    }
    private static Query generateQuery(String property,Object value){
        Query query = new Query();
        query.addCriteria(where(property).is(value));
        return query;
    }
    
    
}
