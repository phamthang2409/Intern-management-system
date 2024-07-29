package User;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "User")
public class User {
	    // Attributes
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int ID;
	
	@Column(name = "username", nullable = false, unique = false)
	private String userName;
	
	@Column(name = "passWord", nullable = false, unique = false)
	private String passWord;
	
	@Column(name = "role", nullable = false, unique = false)
	private String role;
	    
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
