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
public class Profile { 
    private int ID;
    private String profileFirstName;
    private String profileLastName;
    private Date profileDOB;
    private String profileEmail;
    private String trainingProgram;
    private String profilePhone;
    private String profileEducation;
    private String profilePosition;
    private String profileSalary;
    private int status;

    public Profile() {
    }

    public Profile(String profileFirstName, String profileLastName, Date profileDOB, String profileEmail, String trainingProgram, String profilePhone, String profileEducation, String profilePosition, String profileSalary, int status) {
        this.profileFirstName = profileFirstName;
        this.profileLastName = profileLastName;
        this.profileDOB = profileDOB;
        this.profileEmail = profileEmail;
        this.trainingProgram = trainingProgram;
        this.profilePhone = profilePhone;
        this.profileEducation = profileEducation;
        this.profilePosition = profilePosition;
        this.profileSalary = profileSalary;
        this.status = status;
    }

    public Profile(int ID, String profileFirstName, String profileLastName, Date profileDOB, String profileEmail, String trainingProgram, String profilePhone, String profileEducation, String profilePosition, String profileSalary, int status) {
        this.ID = ID;
        this.profileFirstName = profileFirstName;
        this.profileLastName = profileLastName;
        this.profileDOB = profileDOB;
        this.profileEmail = profileEmail;
        this.trainingProgram = trainingProgram;
        this.profilePhone = profilePhone;
        this.profileEducation = profileEducation;
        this.profilePosition = profilePosition;
        this.profileSalary = profileSalary;
        this.status = status;
    }

    public String getTrainingProgram() {
        return trainingProgram;
    }

    public void setTrainingProgram(String trainingProgram) {
        this.trainingProgram = trainingProgram;
    }
        
    
    
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
       
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }   
    
    public String getProfileFirstName() {
        return profileFirstName;
    }

    public void setProfileFirstName(String profileFirstName) {
        this.profileFirstName = profileFirstName;
    }

    public String getProfileLastName() {
        return profileLastName;
    }

    public void setProfileLastName(String profileLastName) {
        this.profileLastName = profileLastName;
    }

    public Date getProfileDOB() {
        return profileDOB;
    }

    public void setProfileDOB(Date profileDOB) {
        this.profileDOB = profileDOB;
    }

    public String getProfileEmail() {
        return profileEmail;
    }

    public void setProfileEmail(String profileEmail) {
        this.profileEmail = profileEmail;
    }

    public String getProfilePhone() {
        return profilePhone;
    }

    public void setProfilePhone(String profilePhone) {
        this.profilePhone = profilePhone;
    }

    public String getProfileEducation() {
        return profileEducation;
    }

    public void setProfileEducation(String profileEducation) {
        this.profileEducation = profileEducation;
    }

    public String getProfilePosition() {
        return profilePosition;
    }

    public void setProfilePosition(String profilePosition) {
        this.profilePosition = profilePosition;
    }

    public String getProfileSalary() {
        return profileSalary;
    }

    public void setProfileSalary(String profileSalary) {
        this.profileSalary = profileSalary;
    }
    
}