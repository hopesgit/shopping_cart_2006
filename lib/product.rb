class Product
  attr_reader :category, :name, :quantity, :unit_price

  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity
  end

  def total_price
    @quantity.to_i * @unit_price
  end

  def is_hoarded?
    @quantity.to_i == 0
  end

  def hoard
    @quantity = 0
  end
end
