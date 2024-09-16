/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author PC
 */
public class SkillAssessment {
    private int ID;
    private String InternName;
    private String TeamWorkScore;
    private String FinishWorkScore;
    private String CommunicationScore;
    private int InternID;

    public SkillAssessment() {
    }

    public SkillAssessment(int ID, String InternName, String TeamWorkScore, String FinishWorkScore, String CommunicationScore, int InternID) {
        this.ID = ID;
        this.InternName = InternName;
        this.TeamWorkScore = TeamWorkScore;
        this.FinishWorkScore = FinishWorkScore;
        this.CommunicationScore = CommunicationScore;
        this.InternID = InternID;
    }

    public SkillAssessment(String InternName, String TeamWorkScore, String FinishWorkScore, String CommunicationScore, int InternID) {
        this.InternName = InternName;
        this.TeamWorkScore = TeamWorkScore;
        this.FinishWorkScore = FinishWorkScore;
        this.CommunicationScore = CommunicationScore;
        this.InternID = InternID;
    }
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getInternName() {
        return InternName;
    }

    public void setInternName(String InternName) {
        this.InternName = InternName;
    }

    public String getTeamWorkScore() {
        return TeamWorkScore;
    }

    public void setTeamWorkScore(String TeamWorkScore) {
        this.TeamWorkScore = TeamWorkScore;
    }

    public String getFinishWorkScore() {
        return FinishWorkScore;
    }

    public void setFinishWorkScore(String FinishWorkScore) {
        this.FinishWorkScore = FinishWorkScore;
    }

    public String getCommunicationScore() {
        return CommunicationScore;
    }

    public void setCommunicationScore(String CommunicationScore) {
        this.CommunicationScore = CommunicationScore;
    }

    public int getInternID() {
        return InternID;
    }

    public void setInternID(int InternID) {
        this.InternID = InternID;
    }
    
    
}
