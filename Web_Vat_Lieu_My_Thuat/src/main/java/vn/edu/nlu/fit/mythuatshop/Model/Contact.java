package vn.edu.nlu.fit.mythuatshop.Model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Contact implements Serializable {
    private int id;
    private int userId;
    private String fullName;
    private String email;
    private String phoneNumber;
    private String message;   // đổi từ text -> message
    private String status;
    private Timestamp createAt;

    public Contact() {}

    public Contact(int id, int userId, String fullName, String email,
                   String phoneNumber, String message, String status,
                   Timestamp createAt) {
        this.id = id;
        this.userId = userId;
        this.fullName = fullName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.message = message;
        this.status = status;
        this.createAt = createAt;
    }

    // getter / setter

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Timestamp getCreateAt() { return createAt; }
    public void setCreateAt(Timestamp createAt) { this.createAt = createAt; }
}
