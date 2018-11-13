class Order < ApplicationRecord
    enum pay_type: {
        "Check" => 0,
        "Credit card" => 1,
        "Purchase order" => 2
    }

    def add_line_items_from_cart(cart)
        cart.line_items.each do |item|
            item.cart_id = nil
            #we set each item's cart_id to nil so that
            #when we destroy the cart, the item doesn't 
            #disappear, this step is vital because in models/cart.rb
            #cart has_many :line_items, and the dependent: :destroy thing
            #meaning that the line_items in a cart will be destroyed along with the
            #cart at the cart's time of destruction. If we unbind the line_item's id
            #in this way then when the cart is destroyed it will still stick around...
            #it kind of flips, so to speak.
            line_items << item
            #here the item we are iterating upon is shoveled into line_items collection for the order
            #and this may seem a bit nebulous, but the 'line_items' here refers to the
            #line_item(s) present in the Order model by default.
        end
    end

    has_many :line_items, dependent: :destroy
    validates :name, :address, :email, presence: true
    validates :pay_type, inclusion: pay_types.keys

end
