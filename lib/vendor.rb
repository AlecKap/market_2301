class Vendor
  attr_reader :name,
              :inventory,
              :potential_revenue

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
    @potential_revenue = 0.0
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
    @potential_revenue += (item.price * quantity)
  end
end