package Model;
import java.util.Date;

public class Task {
    private int id;
    private String name;
    private String description;
    private Date deadline;
    private TrainingProgram trainingProgram;
    private Trainee trainee;

    public Task() {}

    public Task(String name, String description, Date deadline, TrainingProgram trainingProgram, Trainee trainee) {
        this.name = name;
        this.description = description;
        this.deadline = deadline;
        this.trainingProgram = trainingProgram;
        this.trainee = trainee;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public TrainingProgram getTrainingProgram() {
        return trainingProgram;
    }

    public void setTrainingProgram(TrainingProgram trainingProgram) {
        this.trainingProgram = trainingProgram;
    }

    public Trainee getTrainee() {
        return trainee;
    }

    public void setTrainee(Trainee trainee) {
        this.trainee = trainee;
    }
}
