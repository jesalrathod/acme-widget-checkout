# frozen_string_literal: true

# Calculates delivery charges based on a subtotal.
# Represents the "strategy" for delivery calculation.
class DeliveryChargeCalculator
  def initialize(rules)
    @rules = rules.sort_by { |rule| rule[:threshold] }.reverse
  end

  def calculate(subtotal)
    rule = @rules.find { |r| subtotal >= r[:threshold] }
    rule ? rule[:cost] : 0
  end
end
