
namespace :email do
    desc "send an example email"
    task send: : environment do 
        UserMailer.registration_email(user).deliver_now
        puts "email has successfuly delivered"
    end
end