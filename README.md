# Student API

## Overview
`student-api` is a simple RESTful API built with **Spring Boot** and **PostgreSQL** to manage student and subject information for a Software Engineering program. It provides two endpoints to retrieve student details and subjects organized by academic year. The project is developed in Java, uses Spring Data JPA for database interactions, and is deployable on an AWS Ubuntu server with Nginx.

This project was created as part of an assignment to demonstrate API development, version control with GitHub, and cloud deployment.

## Features
- Retrieve a list of at least 10 students with their names and enrolled programs.
- Retrieve subjects for a Software Engineering program, spanning Years 1 to 4, with academic year details.
- PostgreSQL database integration for persistent storage.
- Deployable on AWS with Nginx as a reverse proxy.

## Tech Stack
- **Language**: Java 17
- **Framework**: Spring Boot 3.2.4
- **Database**: PostgreSQL
- **ORM**: Spring Data JPA
- **Build Tool**: Maven
- **Server**: Embedded Tomcat (local), Nginx (AWS)
- **Cloud**: AWS EC2 (Ubuntu)

## Prerequisites
- Java 17+ JDK
- Maven (or use the included Maven Wrapper: `mvnw`)
- PostgreSQL (with pgAdmin recommended)
- Git
- AWS account (for deployment)

## Setup Instructions

### Local Development
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/rachel-26/student
   cd student-api