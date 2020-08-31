class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.price_change.subject
  #
  def price_change
    @user = params[:user]
    @item = params[:item]

    mail(to: @user.email, subject: 'Price update')
  end
end
