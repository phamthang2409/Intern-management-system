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
    private int ID;
    private String candidateID;
    private String candidateName;
    private Date startDate;
    private Time sessionStartTime;
    private String Location;
    private int staffID;

    public InterviewScheduling() {
    }

    public InterviewScheduling(int ID, String candidateID, String candidateName, Date startDate, Time sessionStartTime, String Location, int staffID) {
        this.ID = ID;
        this.candidateID = candidateID;
        this.candidateName = candidateName;
        this.startDate = startDate;
        this.sessionStartTime = sessionStartTime;
        this.Location = Location;
        this.staffID = staffID;
    }

    public InterviewScheduling(String candidateID, String candidateName, Date startDate, Time sessionStartTime, String Location, int staffID) {
        this.candidateID = candidateID;
        this.candidateName = candidateName;
        this.startDate = startDate;
        this.sessionStartTime = sessionStartTime;
        this.Location = Location;
        this.staffID = staffID;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    

    public int getStaffID() {
        return staffID;
    }

    public void setStaffID(int staffID) {
        this.staffID = staffID;
    }

    
    public String getCandidateID() {
        return candidateID;
    }

    public void setCandidateID(String candidateID) {
        this.candidateID = candidateID;
    }

    public String getCandidateName() {
        return candidateName;
    }

    public void setCandidateName(String candidateName) {
        this.candidateName = candidateName;
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
