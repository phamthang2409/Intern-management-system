/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author PC
 */
public class RecruitmentCampaign {
    private int ID;
    private String CampaignName;
    private String Position;
    private int Salary;
    private String Education;

    public RecruitmentCampaign() {
    }

    public RecruitmentCampaign(int ID, String CampaignName, String Position, int Salary, String Education) {
        this.ID = ID;
        this.CampaignName = CampaignName;
        this.Position = Position;
        this.Salary = Salary;
        this.Education = Education;
    }

    
    
    public RecruitmentCampaign(String CampaignName, String Position, int Salary, String Education) {
        this.CampaignName = CampaignName;
        this.Position = Position;
        this.Salary = Salary;
        this.Education = Education;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getCampaignName() {
        return CampaignName;
    }

    public void setCampaignName(String CampaignName) {
        this.CampaignName = CampaignName;
    }

    public String getPosition() {
        return Position;
    }

    public void setPosition(String Position) {
        this.Position = Position;
    }

    public int getSalary() {
        return Salary;
    }

    public void setSalary(int Salary) {
        this.Salary = Salary;
    }

    public String getEducation() {
        return Education;
    }

    public void setEducation(String Education) {
        this.Education = Education;
    }
    
}
