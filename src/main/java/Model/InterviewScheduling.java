/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author PC
 */
public class InterviewScheduling {
    private int ID;
    private String CandidateName;
    private Date InternViewDateTime;
    private String Location;

    public InterviewScheduling() {
    }

    public InterviewScheduling(String CandidateName, Date InternViewDateTime, String Location) {
        this.CandidateName = CandidateName;
        this.InternViewDateTime = InternViewDateTime;
        this.Location = Location;
    }

    public InterviewScheduling(int ID, String CandidateName, Date InternViewDateTime, String Location) {
        this.ID = ID;
        this.CandidateName = CandidateName;
        this.InternViewDateTime = InternViewDateTime;
        this.Location = Location;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getCandidateName() {
        return CandidateName;
    }

    public void setCandidateName(String CandidateName) {
        this.CandidateName = CandidateName;
    }

    public Date getInternViewDateTime() {
        return InternViewDateTime;
    }

    public void setInternViewDateTime(Date InternViewDateTime) {
        this.InternViewDateTime = InternViewDateTime;
    }

    public String getLocation() {
        return Location;
    }

    public void setLocation(String Location) {
        this.Location = Location;
    }
    
    
}
