class StoreController < ApplicationController
  include CurrentCart
  include CurrentCount

  before_action :set_cart, :count, only: [:index]

  def index
    @products = Product.order(:title)
  end
end
