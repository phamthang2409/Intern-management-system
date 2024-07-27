package Intern;

import java.util.Date;
public class Information {
	private String FullName;
    private Date DateOfBirth;
    private String Gender;
    private String Address;
    private String PhoneNumber;
    private String Email;

    // Constructor
    public Information(String FullName, Date DateOfBirth, String Gender, String Address, String PhoneNumber, String Email) {
        this.FullName = FullName;
        this.DateOfBirth = DateOfBirth;
        this.Gender = Gender;
        this.Address = Address;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
    }

    // Getters and Setters
    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public Date getDateOfBirth() {
        return DateOfBirth;
    }

    public void setDateOfBirth(Date DateOfBirth) {
        this.DateOfBirth = DateOfBirth;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
}
