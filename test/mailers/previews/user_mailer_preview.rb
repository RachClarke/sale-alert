# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/price_change
  def price_change
    user = User.first
    item = user.items.first
    old_price = item.current_price
    UserMailer.with(user: user, item: item).price_change
  end

end
