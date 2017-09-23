namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
    # if Time.now.sunday?
      employees = Employee.all  
      notification_message = "Calories: Breakfast - 20%,
      Lunch - 33%,
      Dinner - 33%,
      Snacks -10%
      
      What GM Goal has been completed today?"
      
      employees.each do |employee|
        AuditLog.create!(user_id: employee.id)
        cut_phone = employee.phone[1..-1]
        SmsTool.send_sms(number: cut_phone, message: notification_message)
      end
    # end
  end

  desc "Sends mail notification to managers (admin users) each day to inform of pending overtime requests"
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end
  


end