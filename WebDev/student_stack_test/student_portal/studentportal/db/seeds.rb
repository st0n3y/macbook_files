student1 = Student.create!(first_name: "David", last_name: "MacKintosh", cohort: 4)
student2 = Student.create!(first_name: "Donald", last_name: "Lessells", cohort: 4)
Student.create!(first_name: "Zak", last_name: "Buys", cohort: 4)
Student.create!(first_name: "Claire", last_name: "Smith", cohort: 3)
Student.create!(first_name: "Craig", last_name: "Morton", cohort: 3)

task1 = Task.create!(name: "Do this")
task2 = Task.create!(name: "Do that")

Completed_Task.create!(student_id: student1.id, task_id: task1.id)
Completed_Task.create!(student_id: student2.id, task_id: task2.id)