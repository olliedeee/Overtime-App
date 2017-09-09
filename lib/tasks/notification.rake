namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
  #to schedule later on Heroku
  # User.all.each do |user|
  # end
  end
  
  desc "Sends Mail notification to managers (admin users) daily to inform of overtime requests"
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all
    if submitted_posts.count > 0
      puts "some submitted posts were found"
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_later
      end
    end
  end
end
 # 1. iterate over pending overtime requests
    # 2. check to see if there are any requests 
    # 3. Iterate over list of admin user/managers
    # 4. Send the email to each admin