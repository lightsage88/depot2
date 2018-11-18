class ChargeOrderJob < ApplicationJob
  queue_as :default

  def perform(order, pay_type_params)
    puts "performing charge!() and a 1 and a 2 and 3..."
    order.charge!(pay_type_params)
  end
end
