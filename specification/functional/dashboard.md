## 📘 Simplified MCQ Question & Dashboard System

### Dashboard

#### Student Dashboard
Student can see the statistics of his/her own performance
 - Number of questions attempted
 - Number of correct answers
  - Success ratio (percentage)

 A line graph 
  - on the success ration on day basis
  - number of questions attempted each day
  - render with animation

#### Admin Dashboard
Admin can see the performance summary of all students:
  - List of students
  - For each student:
    - Number of questions attempted
    - Number of correct answers
    - Number of incorrect answers
    - Success ratio (percentage)
 A line graph 
  - on the success ration on day basis
  - number of questions attempted each day
  - render with animation
  

### 2. Functional Requirements

#### Dashboard

For every student:
```
  attempts = StudentAnswer.count
  correct = StudentAnswer.where(correct: true).count
  incorrect = StudentAnswer.where(correct: false).count
  percentage = (correct / attempts) * 100
```