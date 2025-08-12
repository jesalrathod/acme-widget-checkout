# frozen_string_literal: true

require_relative 'basket'

# Define the data
CATALOGUE = [
  Product.new(code: 'R01', price: 32.95),
  Product.new(code: 'G01', price: 24.95),
  Product.new(code: 'B01', price: 7.95)
].freeze

DELIVERY_RULES = [
  { threshold: 90.00, cost: 0.00 },
  { threshold: 50.00, cost: 2.95 },
  { threshold: 0.00, cost: 4.95 }
].freeze

OFFERS = [
  Offer.new
].freeze

puts "--- Acme Widget Co Basket Checkout ---"

# Example 1
puts "\nBasket 1: B01, G01"
basket1 = Basket.new(catalogue: CATALOGUE, delivery_rules: DELIVERY_RULES, offers: OFFERS)
basket1.add('B01')
basket1.add('G01')
puts "Total price: $#{'%.2f' % basket1.total}"

# Example 2
puts "\nBasket 2: R01, R01"
basket2 = Basket.new(catalogue: CATALOGUE, delivery_rules: DELIVERY_RULES, offers: OFFERS)
basket2.add('R01')
basket2.add('R01')
puts "Total price: $#{'%.2f' % basket2.total}"

# Example 3
puts "\nBasket 3: R01, G01"
basket3 = Basket.new(catalogue: CATALOGUE, delivery_rules: DELIVERY_RULES, offers: OFFERS)
basket3.add('R01')
basket3.add('G01')
puts "Total price: $#{'%.2f' % basket3.total}"

# Example 4
puts "\nBasket 4: B01, B01, R01, R01, R01"
basket4 = Basket.new(catalogue: CATALOGUE, delivery_rules: DELIVERY_RULES, offers: OFFERS)
basket4.add('B01')
basket4.add('B01')
basket4.add('R01')
basket4.add('R01')
basket4.add('R01')
puts "Total price: $#{'%.2f' % basket4.total}"
