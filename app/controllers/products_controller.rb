class ProductsController < ApplicationController
  def index
    @productos = Product.all
  end
end
