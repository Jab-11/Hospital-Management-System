package com.entities;

import javax.persistence.*;

@Entity
@Table(name = "medicine")
public class Medicine {
    @Id
    @Column(name = "mid")
    private String mid;
    
    @Column(name = "name")
    private String name;
    
    @Column(name = "price")
    private double price;
    
    @Column(name = "count")
    private int count;

    // Default constructor
    public Medicine() {
    }

    // Parameterized constructor
    public Medicine(String mid, String name, double price, int count) {
    	this.mid = mid;
        this.name = name;
        this.price = price;
        this.count = count;
    }

    // Getters and setters
    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    // toString method
    @Override
    public String toString() {
        return "Medicine{" +
                "mid=" + mid +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", count=" + count +
                '}';
    }
}
