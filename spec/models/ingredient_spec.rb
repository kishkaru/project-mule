require 'spec_helper'

describe Ingredient do
  before(:each) do
    @item = Item.create({:name => 'Bongo Burger',
          :price => 7.99,
          :quantity => 30,
          :expires_at => '08/27/2013 10:45 AM'})
    @ingredient = Ingredient.create(:name => 'tomato')
    @ingredient.items << @item
  end
  describe 'adding an ingredient' do
    Ingredient.find(:all).include?(@ingredient) == true
  end

  describe 'deleting an ingredient' do
    Ingredient.destroy(@ingredient)
    Ingredient.find_by_name('tomato').should == nil
  end

  describe 'edit an ingredient' do
    @ingredient.name.should == 'tomato'
    @ingredient.name= 'potato'
    @ingredient.name.should == 'potato'
  end

  describe 'reading an ingredient' do
    Ingredient.find_by_name('tomato').should == @ingredient
  end
end
