/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.dao;

import com.crackers.informatronyx.models.DownloadRecord;
import java.net.UnknownHostException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Nelson
 */
@Repository
public class DownloadRecordDAO {
    @Autowired MongoOperations downloadRecordMongoOps;
    
    public  List<DownloadRecord> getAllDownloadRecordByUserID(String id) throws UnknownHostException {
        
        return downloadRecordMongoOps.find(query(where("userId").is(id)), DownloadRecord.class);
    }
    
    public  List<DownloadRecord> getAllDownloadRecordByLearningObjectID(String objectID) throws UnknownHostException {
        
        return downloadRecordMongoOps.find(query(where("learningObjectId").is(objectID)), DownloadRecord.class);
    }
    
    public  boolean addDownloadRecord(DownloadRecord record) throws UnknownHostException {
        try {
            
            downloadRecordMongoOps.insert(record);
            return true;         
        } catch (NullPointerException ex) {System.out.println(ex.getMessage()); return false;}
    }
    
    public  boolean editDownloadRecord(DownloadRecord record) throws UnknownHostException {
        try {
            
            Update updateDownloadRecord = new Update();
            updateDownloadRecord.set("id",record.getId());
            updateDownloadRecord.set("userId", record.getUserId());
            updateDownloadRecord.set("learningObjectId",record.getLearningObjectId());
            updateDownloadRecord.set("dateDownload", record.getDateDownload());
            downloadRecordMongoOps.findAndModify(query(where("id").is(record.getId()).andOperator((where("learningObjectId").is(record.getLearningObjectId()).andOperator(
                                         where("userId").is(record.getUserId()))))), updateDownloadRecord,DownloadRecord.class);
            return true;
        } catch (NullPointerException ex) {System.out.println(ex.getMessage()); return false;}
    }
    
    public  boolean removeDownloadRecord(DownloadRecord record) throws UnknownHostException {
        try {
            
            downloadRecordMongoOps.remove(query(where("id").is(record.getId()).andOperator(where("learningObjectId").is(record.getLearningObjectId()))), DownloadRecord.class);
            return true;         
        } catch (NullPointerException ex) {System.out.println(ex.getMessage()); return false;}
    }
    
    public static void main(String[] args) throws Exception {
        DownloadRecord dr = new DownloadRecord();
        DownloadRecord dr2 = new DownloadRecord();
        
        dr.setId("1");
        dr.setLearningObjectId("LO1");
        dr.setUserId("5614ec1bc73542aa486b7885");
        //DownloadRecordDAO.addDownloadRecord(dr);
        
        //JOptionPane.showMessageDialog(null, DownloadRecordDAO.getAllDownloadRecordByLearningObjectID("1LO").toString());
       // JOptionPane.showMessageDialog(null, DownloadRecordDAO.getAllDownloadRecordByUserID("U2").toString());
        
    }
}
