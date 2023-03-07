class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map { |vendor| vendor.name }
  end

  def vendors_that_sell(item)
    vendors = []
    @vendors.each do |vendor|
      vendors << vendor if vendor.inventory.keys.include?(item)
    end
    vendors
  end

  def sorted_item_list
    list_of_names = @vendors.flat_map do |vendor|
      vendor.inventory.keys
    end
    list_of_names.sort!.uniq
  end

  def total_inventory
    quant_of_items = Hash.new
    total_items.each do |item|
      @vendors.each do |vendor|
       
        quant_of_items[item] = {
          "quantity" => total_quantity(item),
          "vendors" => vendors_that_sell(item)
        }
      end
    end
    quant_of_items
  end

  def total_quantity(item)
    @vendors.sum do |vendor|
      vendor.check_stock(item)
    end
  end

  def total_items
    @vendors.flat_map { |vendor| vendor.inventory.keys.uniq }
  end

  # def overstocked_items
  #   # An item is overstocked if it is sold by more than 1 vendor 
  #   # AND the total quantity is greater than 50.
  #   items = []
  #   @vendors.each do |vendor|
  #     
  #   end
  # end
end
