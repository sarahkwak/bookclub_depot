class StoreController < ApplicationController
  include CurrentCart
  include CurrentCount

  skip_before_action :authorize
  before_action :set_cart, :count, only: [:index]

  def index
    @products = Product.order(:title)
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
  end
end
