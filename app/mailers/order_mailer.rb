class OrderMailer < ApplicationMailer
  default from: "Captain Neemo <depot@example.com>"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received(order)
    @order = order
    @greeting = "Hello, hooman, we are greeting you"

    mail to: order.email, subject: 'Gratitude from Fox Hound!'
  end

  

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped(order)
    @order = order 
    @greeting = "Hi there, hooman, we shipped you something."

    mail to: order.email, subject: 'FoxHound Item Shipped'
  end

  def store_error_mail(order)
    puts "We should get an error mail"
    @order = order
    @greeting = "Hey there, Mr. Administrator, we have a problem!"
    mail to: "adrian.e.rosales@gmail.com", subject: "Houston, we have a problem!"
  end
end
