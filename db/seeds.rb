  @user = User.create!(email: "test@test.com", password: "password",
        password_confirmation: "password", first_name: "Jon", last_name: "Snow", phone:"12345678901")
puts "One user created"


@admin = AdminUser.create!(email: "admin@test.com", password:"password",
        password_confirmation: "password", first_name: "Admin", last_name: "Surname", phone:"12345678901")

puts "One admin created"
25.times do |post|
  Post.create!(date: Date.today, rationale:"This is the rationale for post number #{post} and was created by #{@user.full_name}", user_id: @user.id, overtime_request: 2.5)
end

25.times do |post|
  Post.create!(date: Date.today, rationale:"This is the rationale for post number #{post} and was created by #{@admin.full_name}", user_id: @admin.id, overtime_request: 1.5)
end

puts "50 posts have been created"


15.times do |audit_log|
  AuditLog.create!(start_date: Date.today-6.days, user_id: @user.id, status: 0)
end

puts "15 audit logs have been created"


