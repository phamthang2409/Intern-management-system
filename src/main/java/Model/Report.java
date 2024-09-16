package Model;

import java.util.Date;

public class Report {
    private int id;
    private String data;
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
