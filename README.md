# Acme Widget Co. Basket Checkout

This is a proof of concept for Acme Widget Co's new sales system, implementing a shopping basket with special offers and dynamic delivery charges.

## Design
The solution is built with a focus on **separation of concerns** and **extensibility**. The core components are:
* **`Product`**: A simple data object for product information.
* **`Basket`**: The central class that manages items. It does not contain any complex business logic directly. Instead, it uses **Dependency Injection** to receive its catalogue, delivery rules, and offers.
* **`DeliveryChargeCalculator`**: Encapsulates the logic for calculating delivery costs. This uses the **Strategy Pattern** to separate the delivery rules from the `Basket` class, making it easy to change or add new rules without modifying the basket.
* **`Offer`**: Encapsulates the logic for special offers. This also follows the **Strategy Pattern**. The `Basket` can be initialized with an array of different offer objects, allowing for easy expansion with new offers in the future.


## Assumptions
* Product codes are unique and case-sensitive.
* The `Offer` class currently handles only one specific offer. It could be expanded to an `Offer` superclass with multiple subclasses for different types of offers.
* The `delivery_rules` are provided in an array of hashes and are sorted by threshold in the `DeliveryChargeCalculator` for robust lookup.
* Prices and calculations should be handled with floating-point numbers, though for a production system, a dedicated money library would be preferred to avoid precision issues.

This design makes the system flexible, maintainable, and easy to test.

## How to Run
To run the main program and see the example baskets:
```bash
ruby run.rb

To run the unit tests:
```bash
ruby -I. test/basket_test.rb

