package Model;

public class User {

    private int ID;
    private String userName;
    private String passWord;
    private String role;
    private int profileID;

    public User() {
    }

    public User(String userName, String passWord, String role, int profileID) {
        this.userName = userName;
        this.passWord = passWord;
        this.role = role;
        this.profileID = profileID;
    }

    public User(int ID, String userName, String passWord, String role, int profileID) {
        this.ID = ID;
        this.userName = userName;
        this.passWord = passWord;
        this.role = role;
        this.profileID = profileID;
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

    public int getProfileID() {
        return profileID;
    }

    public void setProfileID(int profileID) {
        this.profileID = profileID;
    }    

}
