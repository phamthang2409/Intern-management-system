package User;

public class User {
	    // Attributes
	    private int ID;
	    private String userName;
	    private String passWord;
	    private String role;
	    
	    // Constructor
	    public User(int ID, String userName, String passWord, String role) {
	        this.ID = ID;
	        this.userName = userName;
	        this.passWord = passWord;
	        this.role = role;
	    }
	    
	    // Methods
	    public void logOut() {
	        // Code to log out
	        System.out.println("Logging out...");
	    }
	    
	    public void logIn() {
	        // Code to log in
	        System.out.println("Logging in...");
	    }
	    
	    public void updateProfile() {
	        // Code to update profile
	        System.out.println("Updating profile...");
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
