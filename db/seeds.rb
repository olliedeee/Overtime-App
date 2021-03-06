@employee = Employee.create!(email: "celestus@gmail.com",
										password: "password",
										password_confirmation: "password",
										first_name: "Jon",
										last_name: "Snow",
										ssn: 1234,
										company: "ABC company",
										phone: "07501380210")

puts "1 employee created"

@admin = AdminUser.create!(email: "oliverbucks@gmail.com",
									password: "password",
									password_confirmation: "password",
									first_name: "Admin",
									last_name: "Name",
									ssn: 1235,
									company: "ABC company",
									phone: "01234567891")

puts "1 Admin user created"

AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 6.days))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 13.days))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 20.days))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 27.days))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 34.days))

puts "5 audit logs have been created"

25.times do |post|
	Post.create!(date: Date.today, work_performed: "#{post} work_performed content Lorem ipsum dolor sit amet, anim id est laborum.",
	user_id: @employee.id, daily_hours: 12.5)
end


puts "25 Posts have been created"