package Intern;

import java.util.Date;

public class PerformanceData {
	private String TaskName;
    private Date CompletionDate;
    private String Evaluation;

    // Constructors
    public PerformanceData(String TaskName, Date CompletionDate, String Evaluation) {
        this.TaskName = TaskName;
        this.CompletionDate = CompletionDate;
        this.Evaluation = Evaluation;
    }

    // Getter and Setter methods
    public String getTaskName() {
        return TaskName;
    }

    public void setTaskName(String TaskName) {
        this.TaskName = TaskName;
    }

    public Date getCompletionDate() {
        return CompletionDate;
    }

    public void setCompletionDate(Date CompletionDate) {
        this.CompletionDate = CompletionDate;
    }

    public String getEvaluation() {
        return Evaluation;
    }

    public void setEvaluation(String Evaluation) {
        this.Evaluation = Evaluation;
    }
}
