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

  def test_cart_it_can_total
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal 13, cart.total_number_of_products
  end

  def test_cart_capacity
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    assert_equal false, cart.is_full?
  end

  def test_product_categories_in_cart
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    assert_equal ["toilet paper", "tissue paper"], cart.products_by_category(:paper)
  end
end
