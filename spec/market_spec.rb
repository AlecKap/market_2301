require 'spec_helper'

RSpec.describe Market do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65) 
  end
  describe 'exists and has attributes' do 
    it 'is an instance of' do
      expect(@market).to be_a(Market)
    end

    it '#name' do
      expect(@market.name).to eq("South Pearl Street Farmers Market")
    end

    it '#vendors' do
      expect(@market.vendors).to eq([])
    end
  end

  describe '#add_vendor' do
    it 'returns an array of vendors' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
    end
  end

  describe '#vendor_names' do
    it 'returns an array of names of vendors' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end

  describe '#vendors_that_sell' do
    it 'returns an array of vendors that sell specified item' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
      expect(@market.vendors_that_sell(@item4)).to eq([@vendor2])
    end
  end

  describe '#total_inventory' do
    it 'reports the quantities of all items sold at the market' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.total_inventory). to eq({"name" => 0})
    end
  end

  describe '#overstocked_items' do
    xit '' do
      expect(@market.overstocked_items). to eq(["Peach"])
    end
  end

  describe '#sorted_item_list' do
    it 'returns a list of names of all items that the Vendors have in stock, sorted alphabetically' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.sorted_item_list). to eq(["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"])
    end
  end
end