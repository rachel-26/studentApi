package com.example.student_api.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String program;

    public Student() {}
    
    public Student(Long id, String name, String program) {
        this.id = id;
        this.name = name;
        this.program = program;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getProgram() { return program; }
    public void setProgram(String program) { this.program = program; }
}