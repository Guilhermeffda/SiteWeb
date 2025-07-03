
# Aqui estamos definindo a classe Cart, que representa um carrinho de compras.
# O has_many :line_items indica que um carrinho pode ter muitos itens de linha associados a ele.
# O dependent: :destroy significa que, se um carrinho for excluído, todos os seus itens de linha também serão excluídos.
class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy

    def add_product(product)
        current_item = line_items.find_by(product_id: product.id)
        if current_item
            current_item.quantity += 1
        else
            current_item = line_items.build(product_id: product.id)
        end
        current_item
    end

    def total_price
        line_items.sum { |item| item.total_price }
    end
end
