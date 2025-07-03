class CombineItemsInCart < ActiveRecord::Migration[8.0]
  def change
  end

  def up
    # substitui os itens por um único item
    Cart.all.each do |cart|
      # conta a quantidade de cada produto e agrupa por product_id
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          # remove itens individuais
          cart.line_items.where(product_id: product_id).delete_all
          # coloca um único item
          item = cart.line_items.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    # Dividir itens com quantidade > 1 em múltiplos itens
    LineItem.where("quantity > 1").each do |line_item|
      # Adicionar itens individuais
      line_item.quantity.times do
        LineItem.create(
          cart_id: line_item.cart_id,
          product_id: line_item.product_id,
          quantity: 1
        )
      end

      # Remover o item original
      line_item.destroy
    end
  end
end
