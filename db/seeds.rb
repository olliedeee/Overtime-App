@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")


100.times do |post|
  Post.create!(date: Date.today, rationale:"This is the rationale for post number #{post}", user_id: @user.id)
end

puts "100 posts have been created"





