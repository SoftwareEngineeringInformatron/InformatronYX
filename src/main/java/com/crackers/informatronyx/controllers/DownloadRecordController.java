/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.controllers;

import com.crackers.informatronyx.dto.DownloadRecordDto;
import com.crackers.informatronyx.services.DownloadRecordService;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Nelson
 */
public class DownloadRecordController {
    
    DownloadRecordService DRservice = new DownloadRecordService();

    @RequestMapping("/recordsByUserID")
    public List<DownloadRecordDto> getRecordsbyUserID(@RequestBody String UserID) throws UnknownHostException {
        List<DownloadRecordDto> dtos = new ArrayList<>();
        try {
            dtos = DRservice.getDownloadRecordsByUserID(UserID);
        } catch(NullPointerException ex) {System.out.println(ex.getMessage());}
            return dtos;
    }
    
    @RequestMapping("/recordsByLOID")
    public List<DownloadRecordDto> getRecordsbyLOID(@RequestBody String LOID) throws UnknownHostException {
        List<DownloadRecordDto> dtos = new ArrayList<>();
        try {
            dtos = DRservice.getDownloadRecordsByLOID(LOID);
        } catch(NullPointerException ex) {System.out.println(ex.getMessage());}
            return dtos;
    }
    
    @RequestMapping("/addRecord")
    public boolean addRecord(@RequestBody DownloadRecordDto DR) throws UnknownHostException {
        DRservice.addRecord(DR);
        return true;
    }
    
    @RequestMapping("/editRecord")
    public boolean editRecord(@RequestBody DownloadRecordDto DR) throws UnknownHostException {
        DRservice.editRecord(DR);
        return true;
    }
    
    @RequestMapping("/deleteRecord")
    public boolean deleteRecord(@RequestBody DownloadRecordDto DR) throws UnknownHostException {
        DRservice.removeRecord(DR);
        return true;
    }
}
