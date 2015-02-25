namespace :setup do
  desc "Setup Admin user for first time"
  task admin_user: :environment do
    STDOUT.puts "Enter email id for admin user: "
    email_id = STDIN.gets.strip
    
    STDOUT.puts "Enter password for admin user: "
    password = STDIN.gets.strip
    
    STDOUT.puts "Enter password confirmation for admin user: "
    password_c = STDIN.gets.strip

    if password == password_c
      user = User.create({email: email_id, password: password, user_type: 'a'})
      STDOUT.puts "Admin user created successfully"
    else
      STDOUT.puts "Passwords do not match. Please try again"
      exit 0
    end
  end

end
