# Domain: Question

## 1. Purpose
The Question entity represents a question which is global to all the students.

---

## 2. Description
A question can contain:

- description
- marks
- difficulty_type
- media file to showcase visual image

For example:
 A question with a image of a personality
  "Who is this person?"
  and 4 options



---

## 3. Fields (Attributes)

| Field | Type | Description | Constraints |
|-------|------|-------------|-------------|
| `id` | Integer | Unique identifier | Auto-generated |
| `description` | String | The question text | Required |
| `marks` | Integer | Mark | Required |
| `difficulty_type` | String | Enum | Required |
| `created_at` | DateTime | Timestamp | Auto |
| `updated_at` | DateTime | Timestamp | Auto |

---

## 4. Domain Rules

Admin users can create and modify the questions only.
Admin can create the options for each questions, mark the correct answer.
Once a question is attempted and answer is correct, admin should not update it. 

---

## 5. Relationships

| Relationship | Details |
|-------------|---------|
| **has_many :student_answers** | Each student generates 0..N answer records |


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
