package Model;

public class User {

    private int ID;
    private String userName;
    private String passWord;
    private String role;
    private int internID;

    public User() {
    }

    public User(String userName, String passWord, String role, int internID) {
        this.userName = userName;
        this.passWord = passWord;
        this.role = role;
        this.internID = internID;
    }

    public User(int ID, String userName, String passWord, String role, int internID) {
        this.ID = ID;
        this.userName = userName;
        this.passWord = passWord;
        this.role = role;
        this.internID = internID;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getInternID() {
        return internID;
    }

    public void setInternID(int internID) {
        this.internID = internID;
    }

    
}
