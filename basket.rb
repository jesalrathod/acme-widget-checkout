# frozen_string_literal: true

require_relative 'product'
require_relative 'delivery_charge_calculator'

# Represents a shopping basket along with handling product additions.
class Basket
  def initialize(catalogue:, delivery_rules:)
    @catalogue = catalogue
    @delivery_calculator = DeliveryChargeCalculator.new(delivery_rules)
    @items = []
  end

  def add(product_code)
    product = @catalogue.find { |p| p.code == product_code }
    @items << product if product
  end

  def total
    subtotal = @items.sum(&:price)

    delivery_cost = @delivery_calculator.calculate(subtotal)

    subtotal + delivery_cost
  end
end
