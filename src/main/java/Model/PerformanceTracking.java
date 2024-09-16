/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author PC
 */
public class PerformanceTracking {
    private int ID;
    private String InternID;
    private int AbsentSession;
    private String SkillName;
    private int SkillScore;

    public PerformanceTracking() {
    }

    public PerformanceTracking(int ID, String InternID, int AbsentSession, String SkillName, int SkillScore) {
        this.ID = ID;
        this.InternID = InternID;
        this.AbsentSession = AbsentSession;
        this.SkillName = SkillName;
        this.SkillScore = SkillScore;
    }

    public PerformanceTracking(String InternID, int AbsentSession, String SkillName, int SkillScore) {
        this.InternID = InternID;
        this.AbsentSession = AbsentSession;
        this.SkillName = SkillName;
        this.SkillScore = SkillScore;
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

    public int getAbsentSession() {
        return AbsentSession;
    }

    public void setAbsentSession(int AbsentSession) {
        this.AbsentSession = AbsentSession;
    }

    public String getSkillName() {
        return SkillName;
    }

    public void setSkillName(String SkillName) {
        this.SkillName = SkillName;
    }

    public int getSkillScore() {
        return SkillScore;
    }

    public void setSkillScore(int SkillScore) {
        this.SkillScore = SkillScore;
    }
    
    
}
