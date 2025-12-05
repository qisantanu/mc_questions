# MCQ Questions Rails Application

A Rails 8 application for managing multiple choice questions with student and admin interfaces.

## Features

### Student Features
- Login and answer MCQ questions one by one
- Questions appear in random order
- Immediate feedback after each answer
- Failed questions reappear with 30% probability
- Dashboard showing performance statistics

### Admin Features
- Create, edit, and delete questions
- View student performance dashboard
- Manage multiple choice options and correct answers

## Setup

1. **Install dependencies:**
   ```bash
   bundle install
   ```

2. **Setup database:**
   ```bash
   rails db:migrate
   rails db:seed
   ```

3. **Start the server:**
   ```bash
   rails server
   ```

## Default Users

After running `rails db:seed`, you'll have:

- **Admin:** admin@example.com / password
- **Student:** student@example.com / password

## Usage

1. **Student Interface:**
   - Login at `/login`
   - View dashboard at `/dashboard`
   - Answer questions at `/question`

2. **Admin Interface:**
   - Login at `/login` with admin credentials
   - Manage questions at `/admin/questions`
   - View student performance at `/admin`

## Database Schema

- **Users:** email, password_digest, role (admin/student)
- **Questions:** content, option_a-d, correct_options (JSON array)
- **StudentAnswers:** user_id, question_id, selected_options (JSON), correct (boolean)

## Technology Stack

- Rails 8.1.1
- SQLite3 (development)
- Tailwind CSS (via CDN)
- bcrypt for password hashing
