# Domain: Student

## 1. Purpose
The Student entity represents a learner who logs into the system, answers MCQ questions, and views their performance dashboard.  
A Student has no admin permissions.

---

## 2. Description
A Student can:

- Log into the application  
- Receive questions one-by-one  
- Submit answers (mandatory)  
- View correctness after each question  
- Access a dashboard showing:
  - total attempted
  - total correct
  - total incorrect
  - success percentage  
- Have incorrectly answered questions reappear randomly

Admin users are separate and not part of this domain entity.

---

## 3. Fields (Attributes)

| Field | Type | Description | Constraints |
|-------|------|-------------|-------------|
| `id` | Integer | Unique identifier | Auto-generated |
| `email` | String | Student login email | Required, unique, valid email |
| `password_digest` | String | Hashed password | Required (bcrypt) |
| `name` | String | Display name | Required |
| `created_at` | DateTime | Timestamp | Auto |
| `updated_at` | DateTime | Timestamp | Auto |

---

## 4. Domain Rules

### 4.1 Authentication
- Student must authenticate using email + password.
- Password stored using bcrypt.
- Only Students can access the student answering pages.
- Students cannot access admin screens.

### 4.2 Answering Questions
- Student must select at least one answer.
- Students cannot skip questions.
- Questions appear in random order.
- Wrong answers are added to the *failed pool* for the student.
- Failed questions should reappear with 30% probability.

### 4.3 Dashboard Logic
- Correctness is calculated per answer.
- Dashboard fields:
  - `attempted` = count of StudentAnswer records
  - `correct` = count where correct = true
  - `incorrect` = attempted - correct
  - `success_percentage` = (correct / attempted) * 100
  - `line graph data` = [{ "date" => {attepmted: 10, success_percetage: 80 }}, ...]

### 4.4 Integrity Rules
- A Student cannot modify questions.
- A Student cannot modify correctness records.
- Each answer submitted is immutable once stored.

---

## 5. Relationships

| Relationship | Details |
|-------------|---------|
| **has_many :student_answers** | Each student generates 0..N answer records |
| **has_many :questions, through: :student_answers** | Historical questions answered |

---

## 6. Example JSON (for AI generation)

```json
{
  "id": 1,
  "email": "student@example.com",
  "name": "Rahul Sharma",
  "attempts_summary": {
    "attempted": 24,
    "correct": 18,
    "incorrect": 6,
    "success_percentage": 75
  }
}
