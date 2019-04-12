# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default from: 'chiorean.dan12@gmail.com'

  default template_path: ->(mailer) { "mailers/#{mailer.class.name.underscore}" }

  def new_order(order, user)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'A new order has been sent!')
  end
end
