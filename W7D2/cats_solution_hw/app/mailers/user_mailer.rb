class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user 
        
    end
end
