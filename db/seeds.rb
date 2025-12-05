# Create admin user
admin = User.find_or_create_by(email: 'admin@example.com') do |user|
  user.password = 'password'
  user.role = 'admin'
end

# Create student user
student = User.find_or_create_by(email: 'student@example.com') do |user|
  user.password = 'password'
  user.role = 'student'
end

# Create sample questions
questions_data = [
  {
    content: 'What is the capital of France?',
    option_a: 'London',
    option_b: 'Berlin',
    option_c: 'Paris',
    option_d: 'Madrid',
    correct_options: [ 'C' ]
  },
  {
    content: 'Which of the following are programming languages?',
    option_a: 'Ruby',
    option_b: 'Python',
    option_c: 'HTML',
    option_d: 'JavaScript',
    correct_options: [ 'A', 'B', 'D' ]
  },
  {
    content: 'What is 2 + 2?',
    option_a: '3',
    option_b: '4',
    option_c: '5',
    option_d: '6',
    correct_options: [ 'B' ]
  }
]

questions_data.each do |q_data|
  Question.find_or_create_by(content: q_data[:content]) do |question|
    question.assign_attributes(q_data)
  end
end

puts "Created #{User.count} users and #{Question.count} questions"
