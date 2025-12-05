## 📘 Simplified MCQ Question & Dashboard System — Technical Specification

### 1. Overview

A lightweight Rails 8 application where:
  - Admin manages MCQ questions (CRUD).
  - Student logs in, answers questions one by one (random order).
  - Each question may have single or multiple correct answers.
  - After answering, the student gets immediate feedback.
  - Dashboard shows:
    - Total questions attempted by the student
    - Number correct
    - Success ratio
  - Wrong questions appear again randomly.

Target: Responsive, mobile-first UI.
Database: SQLite3 (development).

### 2. User Roles

  #### 2.1 Admin
  #### 2.2 Student


### Non-Functional Requirements

Passwords hashed (bcrypt).
Only student sees student interface.
Only admin sees admin interface.
CSRF protected.
Background jobs(solid queue) if needed.
Scalable to PostgreSQL later.
