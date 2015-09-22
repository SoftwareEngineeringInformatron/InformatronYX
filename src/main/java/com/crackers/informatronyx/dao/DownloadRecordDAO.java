/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dao;

import com.crackers.informatronyx.config.DatabaseManager;
import com.crackers.informatronyx.models.DownloadRecord;
import java.net.UnknownHostException;
import java.util.List;
import org.springframework.data.mongodb.core.MongoOperations;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;
import org.springframework.data.mongodb.core.query.Update;

/**
 *
 * @author Nelson
 */
public class DownloadRecordDAO {
    public static List<DownloadRecord> getAllDownloadRecordByUserID(String id) throws UnknownHostException {
        MongoOperations mongoOps = DatabaseManager.getMongoOpsInstance("database");
        return mongoOps.find(query(where("userId").is(id)), DownloadRecord.class);
    }
    
    public static List<DownloadRecord> getAllDownloadRecordByLearningObjectID(String objectID) throws UnknownHostException {
        MongoOperations mongoOps = DatabaseManager.getMongoOpsInstance("database");
        return mongoOps.find(query(where("learningObjectId").is(objectID)), DownloadRecord.class);
    }
    
    public static boolean addDownloadRecord(DownloadRecord record) throws UnknownHostException {
        try {
            MongoOperations mongoOps = DatabaseManager.getMongoOpsInstance("database");
            mongoOps.insert(record);
            return true;         
        } catch (NullPointerException ex) {System.out.println(ex.getMessage()); return false;}
    }
    
    public static boolean editDownloadRecord(DownloadRecord record) throws UnknownHostException {
        try {
            MongoOperations mongoOps = DatabaseManager.getMongoOpsInstance("database");
            Update updateDownloadRecord = new Update();
            updateDownloadRecord.set("id",record.getId());
            updateDownloadRecord.set("userId", record.getUserId());
            updateDownloadRecord.set("learningObjectId",record.getLearningObjectId());
            updateDownloadRecord.set("dateDownload", record.getDateDownload());
            mongoOps.findAndModify(query(where("id").is(record.getId()).andOperator((where("learningObjectId").is(record.getLearningObjectId()).andOperator(
                                         where("userId").is(record.getUserId()))))), updateDownloadRecord,DownloadRecord.class);
            return true;
        } catch (NullPointerException ex) {System.out.println(ex.getMessage()); return false;}
    }
    
    public static boolean removeDownloadRecord(DownloadRecord record) throws UnknownHostException {
        try {
            MongoOperations mongoOps = DatabaseManager.getMongoOpsInstance("database");
            mongoOps.remove(query(where("id").is(record.getId()).andOperator(where("learningObjectId").is(record.getLearningObjectId()))), DownloadRecord.class);
            return true;         
        } catch (NullPointerException ex) {System.out.println(ex.getMessage()); return false;}
    }
}
