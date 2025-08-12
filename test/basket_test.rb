# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../basket'

# Define the data for the tests
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

# Test suite for the Basket class.
class BasketTest < Minitest::Test
  def setup
    # Create a fresh basket for each test
    @basket = Basket.new(
      catalogue: CATALOGUE,
      delivery_rules: DELIVERY_RULES,
      offers: OFFERS
    )
  end

  def test_example_basket_one
    @basket.add('B01')
    @basket.add('G01')
    assert_in_delta 37.85, @basket.total, 0.001
  end

  def test_example_basket_two
    @basket.add('R01')
    @basket.add('R01')
    assert_in_delta 54.37, @basket.total, 0.001
  end

  def test_example_basket_three
    @basket.add('R01')
    @basket.add('G01')
    assert_in_delta 60.85, @basket.total, 0.001
  end

  def test_example_basket_four
    @basket.add('B01')
    @basket.add('B01')
    @basket.add('R01')
    @basket.add('R01')
    @basket.add('R01')
    assert_in_delta 98.27, @basket.total, 0.001
  end

  # A custom test to verify the "buy one, get one half price" discount
  def test_buy_3_red_widgets_discount
    @basket.add('R01')
    @basket.add('R01')
    @basket.add('R01')
    # Subtotal: 32.95 * 3 = 98.85
    # Discount: 32.95 / 2 = 16.475
    # Subtotal after discount: 98.85 - 16.475 = 82.375
    # Delivery (under 90): 2.95
    # Total: 82.375 + 2.95 = 85.325
    assert_in_delta 85.325, @basket.total, 0.001
  end
end
