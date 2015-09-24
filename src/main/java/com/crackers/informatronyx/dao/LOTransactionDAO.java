/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dao;

import com.crackers.informatronyx.config.AppConfig;
import com.crackers.informatronyx.config.DatabaseManager;
import java.net.UnknownHostException;
import java.util.List;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import org.springframework.data.mongodb.core.query.Query;
import com.crackers.informatronyx.models.LearningObjectTransaction;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Ted Ian Osias
 */
public class LOTransactionDAO {
    
    public static boolean recordLOTransaction(LearningObjectTransaction transaction) throws UnknownHostException
    {
        DatabaseManager.getMongoOpsInstance(AppConfig.DATABASE_TRANSACTION).insert(transaction);
        return true;
    }
    public static boolean updateLOTransaction(LearningObjectTransaction transaction) throws UnknownHostException
    {
        if(getLOTransactionByProperty("id",transaction.getId()) != null){
            DatabaseManager.getMongoOpsInstance(AppConfig.DATABASE_TRANSACTION).save(transaction);
            return true;
        }
        return false;
    }
    public static boolean deleteLOTransaction(LearningObjectTransaction transaction) throws UnknownHostException 
    {   
        Logger.getLogger(LOTransactionDAO.class.getName()).log(Level.INFO, 
            DatabaseManager.getMongoOpsInstance(AppConfig.DATABASE_TRANSACTION).remove(getLOTransactionByProperty("id",transaction.getId())).toString()
        );
        return true;
    }
    private static LearningObjectTransaction getLOTransactionByProperty(String property,Object value) throws UnknownHostException{
        Query query = new Query();
        query.addCriteria(where(property).is(value));
        return DatabaseManager.getMongoOpsInstance(AppConfig.DATABASE_TRANSACTION).findOne(query, LearningObjectTransaction.class);
    }
    public static List<LearningObjectTransaction> getAllLOTransactionByUser(String id) 
    {
        try {
            Query query = new Query();
            query.addCriteria(where("user_Id").is(id));
            return DatabaseManager.getMongoOpsInstance(AppConfig.DATABASE_TRANSACTION).find(query, LearningObjectTransaction.class);
        } catch (UnknownHostException ex) {
            return null;
        }
    }
}
