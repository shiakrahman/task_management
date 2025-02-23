class UserMailer < ApplicationMailer
    default from: 'no-reply@example.com'
    def registration_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')        
    end

    def login_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
end
