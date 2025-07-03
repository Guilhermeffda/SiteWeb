
# Aqui deinimos a classe LineItem, que representa um item de linha em um carrinho de compras.
# Ela pertence a um produto e a um carrinho, estabelecendo as relações entre esses modelos.

class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product
  belongs_to :cart, optional: true

  # Aqui definimos um método para calcular o preço total do item de linha,
  def total_price
    product.price * quantity
  end
end
