package com.example.student_api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.student_api.model.Subject;

public interface SubjectRepository extends JpaRepository<Subject, Long> {
}