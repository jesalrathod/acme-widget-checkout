# frozen_string_literal: true

require_relative 'product'
require_relative 'delivery_charge_calculator'
require_relative 'offer'

# Represents a shopping basket, handling product additions and total calculations.
class Basket
  def initialize(catalogue:, delivery_rules:, offers: [])
    @catalogue = catalogue
    @delivery_calculator = DeliveryChargeCalculator.new(delivery_rules)
    @offers = offers
    @items = []
  end

  def add(product_code)
    product = @catalogue.find { |p| p.code == product_code }
    @items << product if product
  end

  def total
    subtotal = @items.sum(&:price)
    discount = @offers.sum { |offer| offer.apply(@items) }

    final_subtotal = subtotal - discount

    delivery_cost = @delivery_calculator.calculate(final_subtotal)

    final_subtotal + delivery_cost
  end
end
