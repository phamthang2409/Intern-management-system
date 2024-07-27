package Intern;

import java.util.List;

public class Intern {
	private String InternID;
	private String Information;
	private String Tasks;
	private List<String> EducationalPlatforms;
	private List<String> WorkExperienceHistory;
	private List<String> PerformanceData;
	
	//Phản_hồi
	public void sendFeedback(String Feedback) {
        System.out.println("Sending Feedback: " + Feedback);
    }
	
	//Theo_dõi_quá_trình_phát_triển_kĩ_năng_cá_nhân
	public void TrackPersonalSkillDevelopment() {
        System.out.println("Tracking personal skill development");
    }
	 // Getter_và_Setter
    public String getInternID() {
        return InternID;
    }
    public void setInternID(String InternID) {
        this.InternID = InternID;
    }
    public String getInformation() {
        return Information;
    }

    public void setInformation(String Information) {
        this.Information = Information;
    }

    public String getTasks() {
        return Tasks;
    }

    public void setTasks(String Tasks) {
        this.Tasks = Tasks;
    }

    public List<String> getEducationalPlatforms() {
        return EducationalPlatforms;
    }

    public void setEducationalPlatforms(List<String> EducationalPlatforms) {
        this.EducationalPlatforms = EducationalPlatforms;
    }

    public List<String> getWorkExperienceHistory() {
        return WorkExperienceHistory;
    }

    public void setWorkExperienceHistory(List<String> WorkExperienceHistory) {
        this.WorkExperienceHistory = WorkExperienceHistory;
    }

    public List<String> getPerformanceData() {
        return PerformanceData;
    }

    public void setPerformanceData(List<String> PerformanceData) {
        this.PerformanceData = PerformanceData;
    }

}
