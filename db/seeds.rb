5.times do |t|
  Course.create(title: "#{Faker::Job.field} Course", description: Faker::Lorem.sentence)
end

Course.all.each do |c|
  3.times do |t|
    Lesson.create(title: Faker::Job.key_skill, assignees_count: 0, completed_count: 0, course_id: c.id )
  end
end

10.times do |t|
    User.create(name: Faker::Name.first_name, email: Faker::Internet.email, role: 'learner', job_title: Faker::Job.title,
                business_unit: 'Global', department: Faker::Job.field, location: Faker::Address.state,
                hire_date: Faker::Date.backward(30))
end

Lesson.all.each do |l|
  2.times do |t|
    Assignment.create(lesson_id: l.id, due_by: Faker::Date.forward(45), assigned_at: Faker::Date.backward(20),
                      status: "Complete", assignee_id: rand(1..10))
    Assignment.create(lesson_id: l.id, due_by: Faker::Date.forward(45), assigned_at: Faker::Date.backward(20),
                      status: "Incomplete", assignee_id: rand(1..10))
  end
end
