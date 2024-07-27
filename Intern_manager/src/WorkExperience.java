package Intern;

import java.util.Date;

public class WorkExperience {
	private String CompanyName;
    private String Position;
    private Date StartDate;
    private Date EndDate;

    // Constructors
    public WorkExperience(String CompanyName, String Position, Date StartDate, Date EndDate) {
        this.CompanyName = CompanyName;
        this.Position = Position;
        this.StartDate = StartDate;
        this.EndDate = EndDate;
    }

    // Getter and Setter methods
    public String getCompanyName() {
        return CompanyName;
    }

    public void setCompanyName(String CompanyName) {
        this.CompanyName = CompanyName;
    }

    public String getPosition() {
        return Position;
    }

    public void setPosition(String Position) {
        this.Position = Position;
    }

    public Date getStartDate() {
        return StartDate;
    }

    public void setStartDate(Date StartDate) {
        this.StartDate = StartDate;
    }

    public Date getEndDate() {
        return EndDate;
    }

    public void setEndDate(Date EndDate) {
        this.EndDate = EndDate;
    }
}
