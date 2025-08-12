# frozen_string_literal: true

# Represents a special offer that can be applied to a basket.
# The "buy one, get one half price" offer for red widgets.
class Offer
  def apply(items)
    # The offer applies only to the red widget.
    red_widgets = items.select { |item| item.code == 'R01' }

    # If there are two or more, apply the discount.
    discount = 0
    if red_widgets.count >= 2
      # For every two red widgets, one is half price.
      number_of_discounts = red_widgets.count / 2
      discount_per_item = red_widgets.first.price / 2
      discount = number_of_discounts * discount_per_item
    end

    discount
  end
end
