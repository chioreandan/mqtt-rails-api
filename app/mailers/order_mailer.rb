# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default template_path: ->(mailer) { "mailers/#{mailer.class.name.underscore}" }

  def new_order(order, user)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'A new order has been sent!')
  end

  def ending(order, user)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Your order is expiring soon.')
  end
end
