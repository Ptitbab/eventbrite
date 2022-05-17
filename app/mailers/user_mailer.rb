class UserMailer < ApplicationMailer
    default from: 'no-reply@monsite.fr'

    def welcome_email(user)
        @user = user

        @url = 'https://eventbrite-bab.herokuapp.com/'
        mail(to: @user.email, subject: 'Bienvenu chez eventbrite!')
    end
end
