/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.services;

import com.crackers.informatronyx.dao.DownloadRecordDAO;
import com.crackers.informatronyx.dao.LearningObjectDAO;
import com.crackers.informatronyx.dao.UserDAO;
import com.crackers.informatronyx.dto.DownloadRecordDto;
import com.crackers.informatronyx.models.DownloadRecord;
import com.crackers.informatronyx.models.LearningObject;
import com.crackers.informatronyx.models.User;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Nelson
 */
@Service
public class DownloadRecordService {
    @Autowired DownloadRecordDAO dao;
    @Autowired UserDAO userDAO;
    @Autowired LearningObjectDAO loDAO;
    
    public List<DownloadRecordDto> getDownloadRecordsByUserID(String ID) throws UnknownHostException {
        List<DownloadRecord> records = dao.getAllDownloadRecordByUserID(ID);
        List<DownloadRecordDto> objects = new ArrayList<DownloadRecordDto>();        
        for(DownloadRecord model: records) {
            DownloadRecordDto dto = new DownloadRecordDto();
            dto.setId(model.getId());
            dto.setUserId(model.getUserId());
            dto.setLearningObjectId(model.getLearningObjectId());
            dto.setDateDownload(model.getDateDownload());
            objects.add(dto);
        }
        return objects;
    }
    
    public List<DownloadRecordDto> getDownloadRecordsByLOID(String LOID) throws UnknownHostException {
        List<DownloadRecord> records = dao.getAllDownloadRecordByLearningObjectID(LOID);
        List<DownloadRecordDto> objects = new ArrayList<DownloadRecordDto>();        
        for(DownloadRecord model: records) {
            DownloadRecordDto dto = new DownloadRecordDto();
            dto.setId(model.getId());
            dto.setUserId(model.getUserId());
            dto.setLearningObjectId(model.getLearningObjectId());
            dto.setDateDownload(model.getDateDownload());
            objects.add(dto);
        }
        return objects;
    }
    
    public boolean addRecord(DownloadRecordDto record) throws UnknownHostException {
        if(evaluate(record)) {
            DownloadRecord model = new DownloadRecord();
            model.setId(record.getId());
            model.setUserId(record.getUserId());
            model.setLearningObjectId(record.getLearningObjectId());
            model.setDateDownload(record.getDateDownload());
            dao.addDownloadRecord(model);
            return true;
        } else
            return false;
    }
    
    public boolean editRecord(DownloadRecordDto record) throws UnknownHostException {
        if(evaluate(record)) {
            DownloadRecord model = new DownloadRecord();
            model.setId(record.getId());
            model.setUserId(record.getUserId());
            model.setLearningObjectId(record.getLearningObjectId());
            model.setDateDownload(record.getDateDownload());
            dao.editDownloadRecord(model);
            return true;
        } else
            return false;
    }
    
    public boolean removeRecord(DownloadRecordDto record) throws UnknownHostException {
        if(evaluate(record)) {
            DownloadRecord model = new DownloadRecord();
            model.setId(record.getId());
            model.setUserId(record.getUserId());
            model.setLearningObjectId(record.getLearningObjectId());
            model.setDateDownload(record.getDateDownload());
            dao.removeDownloadRecord(model);
            return true;
        } else
            return false;
    }
    
    private boolean evaluate(DownloadRecordDto record) throws UnknownHostException {
        User user = userDAO.getUser(record.getUserId());
        LearningObject lo =  loDAO.getLearningObjectById(record.getLearningObjectId());
        return user != null && lo != null;
    }
}
