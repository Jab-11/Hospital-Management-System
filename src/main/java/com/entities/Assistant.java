package com.entities;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "assistant")
public class Assistant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "aid")
    private int aid;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @Column(name = "phone")
    private String phone;

    @Column(name = "joindate", nullable = false)
    private Date joinDate;

    @Column(name = "password", nullable = false)
    private String password;

    // Constructors, getters, and setters

    public Assistant() {
    }

    public Assistant(String name, String email, String phone, Date joinDate, String password) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.joinDate = joinDate;
        this.password = password;
    }

    // Getters and setters

    public int getId() {
        return aid;
    }

    public void setId(int aid) {
        this.aid = aid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
