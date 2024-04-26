package com.entities;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "patient")
public class Patient {

    @Id
    @Column(name = "pid")
    private String pid;

    @Column(name = "name", nullable = false, length = 255)
    private String name;

    @Column(name = "email", nullable = false, length = 255)
    private String email;

    @Column(name = "phone", nullable = false, length = 15)
    private String phone;

    @Column(name = "age", nullable = false)
    private int age;

    @Column(name = "gender", nullable = false, length = 10)
    private String gender;

    @Column(name = "blood", nullable = false, length = 10)
    private String blood;

    @Column(name = "visited", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date visited;

    @Column(name = "symptom", nullable = false, length = 255)
    private String symptom;

    @Column(name = "disease", nullable = false, length = 255)
    private String disease;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "did", nullable = false)
    private Doctor doctor;

    // Constructors, getters, and setters
    public Patient() {
    }

    public Patient(String pid, String name, String email, String phone, int age, String gender, String blood, Date visited, String symptom, String disease, Doctor doctor) {
        this.pid = pid;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.age = age;
        this.gender = gender;
        this.blood = blood;
        this.visited = visited;
        this.symptom = symptom;
        this.disease = disease;
        this.doctor = doctor;
    }

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBlood() {
		return blood;
	}

	public void setBlood(String blood) {
		this.blood = blood;
	}

	public Date getVisited() {
		return visited;
	}

	public void setVisited(Date visited) {
		this.visited = visited;
	}

	public String getSymptom() {
		return symptom;
	}

	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

}
