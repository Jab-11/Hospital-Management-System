package com.entities;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "doctor")
public class Doctor {
    @Id
    @Column(name = "did")
    private String id;

    @Column(name = "name")
    private String name;

    @Column(name = "email")
    private String email;

    @Column(name = "phone")
    private String phone;

    @Column(name = "age")
    private int age;

    @Column(name = "joindate")
    private Date joinDate;

    @Column(name = "salary")
    private long salary;

    @Column(name = "specialist")
    private String specialist;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public long getSalary() {
		return salary;
	}

	public void setSalary(long salary) {
		this.salary = salary;
	}

	public String getSpecialist() {
		return specialist;
	}

	public void setSpecialist(String specialist) {
		this.specialist = specialist;
	}

	public Doctor() {
	}

	public Doctor(String id, String name, String email, String phone, int age, Date joinDate, long salary,
			String specialist) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.age = age;
		this.joinDate = joinDate;
		this.salary = salary;
		this.specialist = specialist;
	}

	@Override
	public String toString() {
		return "Doctor [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", age=" + age
				+ ", joinDate=" + joinDate + ", salary=" + salary + ", specialist=" + specialist + "]";
	}
}
