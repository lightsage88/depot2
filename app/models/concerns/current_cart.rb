module CurrentCart
    private
    def set_cart
        @cart = Cart.find(session[:cart_id])
        #setting instance method of @cart to the result of
        #'find' the Cart that matches the session's version of cart_id
    rescue ActiveRecord::RecordNotFound
        @cart = Cart.create
        session[:cart_id] = @cart.id
    end
end