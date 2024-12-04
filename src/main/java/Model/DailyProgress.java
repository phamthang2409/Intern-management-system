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
public class DailyProgress {
    private int ID;
    private String InternID;
    private Date DateReport;
    private String Description;
    private int Status;
    private int MentorID;

    public DailyProgress() {
    }

    public DailyProgress(int ID, String InternID, Date DateReport, String Description, int Status, int MentorID) {
        this.ID = ID;
        this.InternID = InternID;
        this.DateReport = DateReport;
        this.Description = Description;
        this.Status = Status;
        this.MentorID = MentorID;
    }

    public DailyProgress(String InternID, Date DateReport, String Description, int Status, int MentorID) {
        this.InternID = InternID;
        this.DateReport = DateReport;
        this.Description = Description;
        this.Status = Status;
        this.MentorID = MentorID;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }


    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getInternID() {
        return InternID;
    }

    public void setInternID(String InternID) {
        this.InternID = InternID;
    }

    public Date getDateReport() {
        return DateReport;
    }

    public void setDateReport(Date DateReport) {
        this.DateReport = DateReport;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getMentorID() {
        return MentorID;
    }

    public void setMentorID(int MentorID) {
        this.MentorID = MentorID;
    }
    
}
