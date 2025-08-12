# frozen_string_literal: true

require_relative 'product'

# Represents a shopping basket along with handling product additions.
class Basket
  def initialize(catalogue:)
    @catalogue = catalogue
    @items = []
  end

  def add(product_code)
    product = @catalogue.find { |p| p.code == product_code }
    @items << product if product
  end
end
