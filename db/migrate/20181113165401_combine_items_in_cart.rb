class CombineItemsInCart < ActiveRecord::Migration[5.2]
  def up
    Cart.all.each do |cart|
      line_items = cart.line_items.group(:product_id).sum(:quantity)
      line_items.each do |key, value|
        if value > 1
          cart.line_items.where(product_id: key).destroy_all
          cart.line_items.create(product_id: key, quantity: value)
        end
      end
    end
  end

  def down
    LineItem.where("quantity>1").each do |line_item|
      line_item.quantity.times do
        LineItem.create(
          product_id: line_item.product_id,
          quantity: 1,
          cart_id: line_item.cart_id
        )
      end
      line_item.destroy
    end
  end
end
