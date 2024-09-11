/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author PC
 */
public class InterviewScheduling {
    private String CandidateID;
    private Date startDate;
    private Time sessionStartTime;
    private String Location;

    public InterviewScheduling() {
    }

    public InterviewScheduling(String CandidateID, Date startDate, Time sessionStartTime, String Location) {
        this.CandidateID = CandidateID;
        this.startDate = startDate;
        this.sessionStartTime = sessionStartTime;
        this.Location = Location;
    }

    public String getCandidateID() {
        return CandidateID;
    }

    public void setCandidateID(String CandidateID) {
        this.CandidateID = CandidateID;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Time getSessionStartTime() {
        return sessionStartTime;
    }

    public void setSessionStartTime(Time sessionStartTime) {
        this.sessionStartTime = sessionStartTime;
    }

    public String getLocation() {
        return Location;
    }

    public void setLocation(String Location) {
        this.Location = Location;
    }

    
    
}
