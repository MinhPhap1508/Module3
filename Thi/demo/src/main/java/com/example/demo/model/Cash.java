package com.example.demo.model;

public class Cash {
    private int id;
    private String name;
    private boolean choose;
    private String date;
    private double price;
    private String description;

    public Cash() {
    }

    public Cash(String name, boolean choose, String date, double price, String description) {
        this.name = name;
        this.choose = choose;
        this.date = date;
        this.price = price;
        this.description = description;
    }

    public Cash(int id, String name, boolean choose, String date, double price, String description) {
        this.id = id;
        this.name = name;
        this.choose = choose;
        this.date = date;
        this.price = price;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isChoose() {
        return choose;
    }

    public void setChoose(boolean choose) {
        this.choose = choose;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
