require 'spec_helper'

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end
  describe 'exists and has attributes' do 
    it 'is an instance of' do
      expect(@vendor).to be_a(Vendor)
    end

    it '#name' do
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end

    it '#inventory' do
      expect(@vendor.inventory).to eq({})
    end
  end

  describe '#check_stock' do
    it 'checks stock of item' do
      expect(@vendor.check_stock(@item1)).to eq(0)
    end
  end

  describe '#stock' do
    it 'stocks item and adjusts inventory accordingly' do
      @vendor.stock(@item1, 30)
      
      expect(@vendor.inventory).to eq({"Peach"=>30})
      expect(@vendor.check_stock(@item1)).to eq(30)
      @vendor.stock(@item1, 25)
      expect(@vendor.check_stock(@item1)).to eq(55)
      @vendor.stock(@item2, 12)
      expect(@vendor.inventory).to eq({"Peach"=>55, "Tomato"=>12})
    end
  end
end