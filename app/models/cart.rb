class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy

    def add_product(producto)
        current_item = line_items.find_by(product_id: producto.id)
        if current_item
            current_item.quantity += 1
        else
        current_item = line_items.build(product_id: producto.id)
        end
        current_item
    end
end
