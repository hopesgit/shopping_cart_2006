class Product
  attr_reader :category, :name, :quantity, :unit_price

  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price.to_f.round(2)
    @quantity = quantity.to_s
  end

  def total_price
    @quantity.to_i * @unit_price
  end

  def is_hoarded?
  end

  def hoard
  end
end
