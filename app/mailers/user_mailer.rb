class UserMailer < ApplicationMailer
    default from: 'brian.variengien@gmail.com'

    def welcome_email(user)
        @user = user

        @url = 'https://eventbrite-bab.herokuapp.com/'
        mail(to: @user.email, subject: 'Bienvenu chez eventbrite!')
    end
end
