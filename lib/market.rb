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
      vendors << vendor if vendor.inventory.keys.include?(item.name)
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
    # reports the quantities of all items sold at the market.
    # return a hash with items as keys and hash as values
    # sub-hash should have two key/value pairs
      # quantity pointing to total inventory for that item
      # vendors pointing to an array of the vendors that sell that item
    quant_of_items = Hash.new
    sorted_item_list.each do |item|
      @vendors.each do |vendor|
        # require 'pry-byebug'; require 'pry'; binding.pry
        quant_of_items[item] = {
          vendor.inventory.values.sum => 0,
          "Vendors" => []
        }
      end
    end
    quant_of_items
    # require 'pry-byebug'; require 'pry'; binding.pry
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
