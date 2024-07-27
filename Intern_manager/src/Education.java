package Intern;

import java.util.Date;
public class Education {
	    private String Degree;
	    private String FieldOfStudy;
	    private String UniversityName;
	    private Date StartDate;
	    private Date EndDate;

	    // Constructor
	    public Education(String Degree, String FieldOfStudy, String UniversityName, Date StartDate, Date EndDate) {
	        this.Degree = Degree;
	        this.FieldOfStudy = FieldOfStudy;
	        this.UniversityName = UniversityName;
	        this.StartDate = StartDate;
	        this.EndDate = EndDate;
	    }

	    // Getters and Setters
	    public String getDegree() {
	        return Degree;
	    }

	    public void setDegree(String Degree) {
	        this.Degree = Degree;
	    }

	    public String getFieldOfStudy() {
	        return FieldOfStudy;
	    }

	    public void setFieldOfStudy(String FieldOfStudy) {
	        this.FieldOfStudy = FieldOfStudy;
	    }

	    public String getUniversityName() {
	        return UniversityName;
	    }

	    public void setUniversityName(String UniversityName) {
	        this.UniversityName = UniversityName;
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
