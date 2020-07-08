require "./lib/product"

class ShoppingCart

  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = (capacity.delete! "items").to_i
    @products = []
  end

  def add_product(item)
    @products << item
  end

  def details
    {
      @name => @capacity
    }
  end

  def total_number_of_products
    total_product = 0
    products.map do |product|
      total_product += product.quantity.to_i
    end
    return total_product
  end

  def is_full?
    products.count == capacity
  end

  def products_by_category(cat)
    category_names = []
    products.find_all do |product|
      if product.category == cat
        category_names << product.name
      end
    end
    return category_names
  end
end
