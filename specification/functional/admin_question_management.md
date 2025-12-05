## 📘 Simplified MCQ Question & Dashboard System

### 1. User Roles
  #### 1.1 Admin

    - Can log in.
    - Create/Edit/Delete questions.
    - Each question includes:
      - Question text
      - 4 options
      - One or more correct answers
    - Can view performance summary for each student.

### 2. System Flow

#### Admin Flow

- Login at /admin/login
- Manage Questions at /admin/questions
- View student dashboard at /admin/dashboard

- List of students

- For each student:
  - Attempted count
  - Correct count
  - Incorrect count
  - Success rate %

### 3. Functional Requirements
  #### 3.1 Question System
  Store 4 options per question.
  Allow selecting 1–4 correct options.
  Enforce presence of question content and at least 2 options.
  Admin users can create and modify the questions.
  Once a question is attempted and answer is correct, admin should not update it.

  #### 3.2 Student Answering Logic

  Question selection logic:
  If failed pool not empty → 30% chance from failed pool.
  Otherwise → pick from remaining pool.
  After user selects answer(s), system evaluates:
  Correct if selected options == correct_options set.
  Store the attempt in DB.
  If incorrect → add to failed pool.
