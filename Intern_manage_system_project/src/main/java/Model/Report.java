package Model;

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
