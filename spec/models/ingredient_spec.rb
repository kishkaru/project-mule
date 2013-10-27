require 'spec_helper'

describe Ingredient do
  before(:each) do
    @item = Item.create(:name => 'Bongo Burger', :price => 7.99, :quantity => 30, :expires_at => '08/27/2013 10:45 AM')
    @ingredient = Ingredient.create(:name => 'tomato')
    @ingredient.items << @item
  end

  it 'adding an ingredient' do
    Ingredient.all.include?(@ingredient) == true
  end

  it 'deleting an ingredient' do
    @ingredient.destroy
    Ingredient.find_by_name('tomato').should == nil
  end

  it 'edit an ingredient' do
    @ingredient.name.should == 'tomato'
    @ingredient.name= 'potato'
    @ingredient.name.should == 'potato'
  end

  it 'reading an ingredient' do
    Ingredient.find_by_name('tomato').should == @ingredient
  end
end
