require "minitest/autorun"
require "minitest/pride"
require "./lib/product"
require "./lib/shopping_cart"

class ShoppingCartTest < Minitest::Test

  def test_it_is_a_shopping_cart
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_instance_of ShoppingCart, cart
  end

  def test_it_has_a_name
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_equal "King Soopers", cart.name
  end

  def test_it_can_hold_products
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, "toilet paper", 3.70, "10")
    product2 = Product.new(:meat, "chicken", 4.50, "2")
    cart.add_product(product1)
    cart.add_product(product2)

    assert_equal 2, cart.products.count
  end

  def test_it_has_details
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_equal ["King Soopers"], cart.details.keys
  end

end
