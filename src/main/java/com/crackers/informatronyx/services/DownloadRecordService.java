/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.services;

import com.crackers.informatronyx.dao.DownloadRecordDAO;
import com.crackers.informatronyx.dto.DownloadRecordDto;
import com.crackers.informatronyx.models.DownloadRecord;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nelson
 */
public class DownloadRecordService {
    public List<DownloadRecordDto> getDownloadRecordsByUserID(String ID) throws UnknownHostException {
        List<DownloadRecord> records = DownloadRecordDAO.getAllDownloadRecordByUserID(ID);
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
        List<DownloadRecord> records = DownloadRecordDAO.getAllDownloadRecordByLearningObjectID(LOID);
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
            DownloadRecordDAO.addDownloadRecord(model);
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
            DownloadRecordDAO.editDownloadRecord(model);
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
            DownloadRecordDAO.removeDownloadRecord(model);
            return true;
        } else
            return false;
    }
    
    private boolean evaluate(DownloadRecordDto record) {
        return true;
    }
}
