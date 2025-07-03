
# Nesse  arquivo, definimos o concern CurrentCart
# que vai gerenciar o carrinho de compras de um usuário.

module CurrentCart
    private
        def set_cart
            @cart = Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound
            @cart = Cart.create
            session[:cart_id] = @cart.id
    end
end
