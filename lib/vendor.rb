class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item.name]
  end

  def stock(item, quantity)
    @inventory[item.name] += quantity
  end
end