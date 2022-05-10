class Cart
  def self.add_order_details(cart,order_id) 
    cart.each do |item|
      OrderDetail.create!( order_id: order_id, product_id: item["product_id"] , quantity: item["quantity"], price: item["price"])
    end
  end
end
