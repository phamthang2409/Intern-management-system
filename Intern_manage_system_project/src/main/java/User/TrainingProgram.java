package User;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "TRAINING_PROGRAMS")
public class TrainingProgram {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "start_date")
    private Date startDate;

    @Column(name = "end_date")
    private Date endDate;

    @ManyToOne
    @JoinColumn(name = "trainer_id")
    private Trainer trainer;

    @ManyToMany(mappedBy = "trainingPrograms")
    private Set<Trainee> trainees = new HashSet<>();

    @OneToMany(mappedBy = "trainingProgram", cascade = CascadeType.ALL)
    private Set<Task> tasks = new HashSet<>();

    public TrainingProgram() {}

    public TrainingProgram(String name, String description, Date startDate, Date endDate, Trainer trainer) {
        this.name = name;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.trainer = trainer;
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

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Trainer getTrainer() {
        return trainer;
    }

    public void setTrainer(Trainer trainer) {
        this.trainer = trainer;
    }

    public Set<Trainee> getTrainees() {
        return trainees;
    }

    public void setTrainees(Set<Trainee> trainees) {
        this.trainees = trainees;
    }

    public Set<Task> getTasks() {
        return tasks;
    }

    public void setTasks(Set<Task> tasks) {
        this.tasks = tasks;
    }
}
2. Task Class
java
Sao chép mã
package com.example.training;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "TASKS")
public class Task {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "deadline")
    private Date deadline;

    @ManyToOne
    @JoinColumn(name = "training_program_id")
    private TrainingProgram trainingProgram;

    @ManyToOne
    @JoinColumn(name = "trainee_id")
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
3. Trainee Class
java
Sao chép mã
package com.example.training;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "TRAINEES")
public class Trainee extends User {
    @ManyToMany
    @JoinTable(
        name = "TRAINEE_TRAINING_PROGRAMS",
        joinColumns = @JoinColumn(name = "trainee_id"),
        inverseJoinColumns = @JoinColumn(name = "training_program_id")
    )
    private Set<TrainingProgram> trainingPrograms = new HashSet<>();

    public Trainee() {}

    public Set<TrainingProgram> getTrainingPrograms() {
        return trainingPrograms;
    }

    public void setTrainingPrograms(Set<TrainingProgram> trainingPrograms) {
        this.trainingPrograms = trainingPrograms;
    }

    public void enrollTrainingProgram(TrainingProgram trainingProgram) {
        this.trainingPrograms.add(trainingProgram);
    }

    public void dropTrainingProgram(TrainingProgram trainingProgram) {
        this.trainingPrograms.remove(trainingProgram);
    }
}
4. Trainer Class
java
Sao chép mã
package com.example.training;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "TRAINERS")
public class Trainer extends User {
    @OneToMany(mappedBy = "trainer", cascade = CascadeType.ALL)
    private Set<TrainingProgram> trainingPrograms = new HashSet<>();

    public Trainer() {}

    public Set<TrainingProgram> getTrainingPrograms() {
        return trainingPrograms;
    }

    public void setTrainingPrograms(Set<TrainingProgram> trainingPrograms) {
        this.trainingPrograms = trainingPrograms;
    }

    public void addTrainingProgram(TrainingProgram trainingProgram) {
        this.trainingPrograms.add(trainingProgram);
    }

    public void removeTrainingProgram(TrainingProgram trainingProgram) {
        this.trainingPrograms.remove(trainingProgram);
    }
}
5. Feedback Class
java
Sao chép mã
package com.example.training;

import javax.persistence.*;

@Entity
@Table(name = "FEEDBACKS")
public class Feedback {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "rating", nullable = false)
    private int rating;

    @ManyToOne
    @JoinColumn(name = "trainee_id")
    private Trainee trainee;

    @ManyToOne
    @JoinColumn(name = "training_program_id")
    private TrainingProgram trainingProgram;

    @ManyToOne
    @JoinColumn(name = "task_id")
    private Task task;

    public Feedback() {}

    public Feedback(String content, int rating, Trainee trainee, TrainingProgram trainingProgram, Task task) {
        this.content = content;
        this.rating = rating;
        this.trainee = trainee;
        this.trainingProgram = trainingProgram;
        this.task = task;
    }

    public int getId() {
        return id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Trainee getTrainee() {
        return trainee;
    }

    public void setTrainee(Trainee trainee) {
        this.trainee = trainee;
    }

    public TrainingProgram getTrainingProgram() {
        return trainingProgram;
    }

    public void setTrainingProgram(TrainingProgram trainingProgram) {
        this.trainingProgram = trainingProgram;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }
}
6. Report Class
java
Sao chép mã
package com.example.training;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "REPORTS")
public class Report {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "data", nullable = false)
    private String data;

    @Column(name = "date_generated", nullable = false)
    private Date dateGenerated;

    public Report() {}

    public Report(String data, Date dateGenerated) {
        this.data = data;
        this.dateGenerated = dateGenerated;
    }

    public int getId() {
        return id;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public Date getDateGenerated() {
        return dateGenerated;
    }

    public void setDateGenerated(Date dateGenerated) {
        this.dateGenerated = dateGenerated;
    }

    public void generateReport() {
        // Implementation here
    }

    public void viewReport() {
        // Implementation here
    }
}
7. User Class
java
Sao chép mã
package com.example.training;

import javax.persistence.*;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "









