/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crackers.informatronyx.models;

import java.util.List;

/**
 *
 * @author Nelson
 */
public class LearningObject {
    private String description;
    private int id;
    private List<LearningElement> sequence;

    public LearningObject() {
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<LearningElement> getSequence() {
        return sequence;
    }
    
    public void setSequence(List<LearningElement> sequence) {
        this.sequence = sequence;
    }
}
