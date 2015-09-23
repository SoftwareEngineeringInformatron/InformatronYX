/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.services;

import com.crackers.informatronyx.dao.DownloadRecordDAO;
import com.crackers.informatronyx.models.DownloadRecord;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nelson
 */
public class DownloadRecordService {
    public List<DownloadRecord> getDownloadRecordsByUserID(DownloadRecord DR, String ID) throws UnknownHostException {
        List<DownloadRecord> records = DownloadRecordDAO.getAllDownloadRecordByUserID(ID);
        List<DownloadRecord> objects = new ArrayList<DownloadRecord>();        
        for(DownloadRecord model: records) {
            model.setId(DR.getId());
            model.setUserId(DR.getUserId());
            model.setLearningObjectId(DR.getLearningObjectId());
            model.setDateDownload(DR.getDateDownload());
            objects.add(model);
        }
        return objects;
    }
    
    public List<DownloadRecord> getDownloadRecordsByLOID(DownloadRecord DR, String LOID) throws UnknownHostException {
        List<DownloadRecord> records = DownloadRecordDAO.getAllDownloadRecordByLearningObjectID(LOID);
        List<DownloadRecord> objects = new ArrayList<DownloadRecord>();        
        for(DownloadRecord model: records) {
            model.setId(DR.getId());
            model.setUserId(DR.getUserId());
            model.setLearningObjectId(DR.getLearningObjectId());
            model.setDateDownload(DR.getDateDownload());
            objects.add(model);
        }
        return objects;
    }
    
    public boolean addRecord(DownloadRecord record) throws UnknownHostException {
        if(evaluate(record)) {
            DownloadRecord model = new DownloadRecord();
            model.setId(record.getId());
            model.setUserId(record.getUserId());
            model.setLearningObjectId(record.getLearningObjectId());
            model.setDateDownload(record.getDateDownload());
            DownloadRecordDAO.addDownloadRecord(model);
            return true;
        } else
            return false;
    }
    
    public boolean editRecord(DownloadRecord record) throws UnknownHostException {
        if(evaluate(record)) {
            DownloadRecord model = new DownloadRecord();
            model.setId(record.getId());
            model.setUserId(record.getUserId());
            model.setLearningObjectId(record.getLearningObjectId());
            model.setDateDownload(record.getDateDownload());
            DownloadRecordDAO.editDownloadRecord(model);
            return true;
        } else
            return false;
    }
    
    public boolean removetRecord(DownloadRecord record) throws UnknownHostException {
        if(evaluate(record)) {
            DownloadRecord model = new DownloadRecord();
            model.setId(record.getId());
            model.setUserId(record.getUserId());
            model.setLearningObjectId(record.getLearningObjectId());
            model.setDateDownload(record.getDateDownload());
            DownloadRecordDAO.removeDownloadRecord(model);
            return true;
        } else
            return false;
    }
    
    private boolean evaluate(DownloadRecord record) {
        return true;
    }
}
