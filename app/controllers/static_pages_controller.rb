class StaticPagesController < ApplicationController
  def home
    @products = Product.last(8)
  end

  def help
  end
end
