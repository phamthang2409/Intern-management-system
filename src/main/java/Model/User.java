package Model;

public class User {

    private int ID;
    private String userName;
    private String passWord;
    private String role;

    public User() {

    }

    // Constructor
    public User(int ID, String userName, String passWord, String role) {
        this.ID = ID;
        this.userName = userName;
        this.passWord = passWord;
        this.role = role;
    }

    // Getters and Setters
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

    public String getpassWord() {
        return passWord;
    }

    public void setpassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}
