## 📘 Simplified MCQ Question & Dashboard System

### 1. User Roles

  #### 1.1 Student

    - Logs in.
    - Answers questions one-by-one (random).
    - Must choose an answer before proceeding.
    - Wrong answers stored → appear again randomly later.
    - Dashboard shows:
     - Total attempted
     - Total correct
     - Total incorrect
     - Percentage correct

### 2. System Flow

#### Student Flow

- Login.
- “Start Answering Questions” button.
- Show one random question.
- Student selects answer(s).
- After submit:
  - Show ✔️ Correct or ❌ Incorrect
  - Highlight correct options.
  - Tap “Next Question”.
  - Wrong questions added to "failed pool".
  - Failed questions appear later (30% probability).

### 3. Functional Requirements
  #### 3.1 Question System
  Store 4 options per question.
  Allow selecting 1–4 correct options.
  Enforce presence of question content and at least 2 options.

  #### 3.2 Student Answering Logic

  Question selection logic:
  If failed pool not empty → 30% chance from failed pool.
  Otherwise → pick from remaining pool.
  After user selects answer(s), system evaluates:
  Correct if selected options == correct_options set.
  Store the attempt in DB.
  If incorrect → add to failed pool.
