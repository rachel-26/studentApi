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

## BackUp
Here are three common schemes:

Full Backup:
Execution: Copies all files and database data every time (e.g., tar for files, pg_dump for PostgreSQL).

Advantages:
Complete restore possible from one backup.
Simple to implement.

Disadvantages:
Slow for large datasets.
High storage usage.


Incremental Backup:
Execution: Backs up only changes since the last backup (full or incremental) using tools like rsync.

Advantages:
Faster than full backups.
Saves storage space.

Disadvantages:
Restore requires combining multiple backups.
More complex to manage.


Differential Backup:
Execution: Backs up changes since the last full backup (not incremental).

Advantages:
Faster restore than incremental (needs only full + latest differential).
Balances speed and storage.

Disadvantages:
Slower and larger than incremental over time.
Requires regular full backups

### Local Development
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/rachel-26/studentApi
   cd student-api# studentApi

## Docker Setup
### Build
```bash
docker build -t student-api:latest .