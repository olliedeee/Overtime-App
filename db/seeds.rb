@user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Jon", last_name: "Snow")
puts "One user created"


@admin = AdminUser.create(email: "admin@test.com", password:"password", password_confirmation: "password", first_name: "Admin", last_name: "Surname")

puts "One admin created"
25.times do |post|
  Post.create!(date: Date.today, rationale:"This is the rationale for post number #{post} and was created by #{@user.full_name}", user_id: @user.id)
end

25.times do |post|
  Post.create!(date: Date.today, rationale:"This is the rationale for post number #{post} and was created by #{@admin.full_name}", user_id: @admin.id)
end

puts "50 posts have been created"





