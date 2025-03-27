package com.example.student_api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.student_api.model.Subject;
import com.example.student_api.repository.StudentRepository;

@RestController
public class StudentController {
    
    @Autowired
    private StudentRepository studentRepository;

    @GetMapping("/students")
    public List<Subject> getAllStudents() {
        return studentRepository.findAll();
    }
}
