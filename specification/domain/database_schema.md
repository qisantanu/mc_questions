## Database Schema

#### Users (users)
Column	Type	Notes
--------------------
id	integer PK	
email	string	unique
password_digest	string	bcrypt
role	string	admin or student
created_at	datetime	
updated_at	datetime	

#### Questions (questions)
Column	Type	Notes
-------------------
id	integer PK	
content	text	question
option_a	string	
option_b	string	
option_c	string	
option_d	string	
correct_options	json	ex: ["A","C"]
created_at	datetime	
updated_at	datetime	

#### Student Answers (student_answers)

Each row = one question answered by a student.

Column	Type	Notes
-------------------
id	integer PK	
user_id	integer FK	
question_id	integer FK	
selected_options	json	ex: ["B"]
correct	boolean	
created_at	datetime	
