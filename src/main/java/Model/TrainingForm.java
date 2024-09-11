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
public class TrainingForm {
    private int ID;
    private String programName;
    private Date startDate;
    private Date endDate;
    private Time sessionStartTime;
    private Time sessionEndTime;
    private String trainerName;
    private int trainerID;

    public TrainingForm() {
    }

    public TrainingForm(int ID, String programName, Date startDate, Date endDate, Time sessionStartTime, Time sessionEndTime, String trainerName, int trainerID) {
        this.ID = ID;
        this.programName = programName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.sessionStartTime = sessionStartTime;
        this.sessionEndTime = sessionEndTime;
        this.trainerName = trainerName;
        this.trainerID = trainerID;
    }

    public TrainingForm(String programName, Date startDate, Date endDate, Time sessionStartTime, Time sessionEndTime, String trainerName, int trainerID) {
        this.programName = programName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.sessionStartTime = sessionStartTime;
        this.sessionEndTime = sessionEndTime;
        this.trainerName = trainerName;
        this.trainerID = trainerID;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getProgramName() {
        return programName;
    }

    public void setProgramName(String programName) {
        this.programName = programName;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Time getSessionStartTime() {
        return sessionStartTime;
    }

    public void setSessionStartTime(Time sessionStartTime) {
        this.sessionStartTime = sessionStartTime;
    }

    public Time getSessionEndTime() {
        return sessionEndTime;
    }

    public void setSessionEndTime(Time sessionEndTime) {
        this.sessionEndTime = sessionEndTime;
    }

    public String getTrainerName() {
        return trainerName;
    }

    public void setTrainerName(String trainerName) {
        this.trainerName = trainerName;
    }

    public int getTrainerID() {
        return trainerID;
    }

    public void setTrainerID(int trainerID) {
        this.trainerID = trainerID;
    }

    
    
    
    
}
