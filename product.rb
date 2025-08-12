# frozen_string_literal: true

# Represents a single product with a code and price.
class Product
  attr_reader :code, :price

  def initialize(code:, price:)
    @code = code
    @price = price
  end
end
