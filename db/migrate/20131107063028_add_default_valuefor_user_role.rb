class AddDefaultValueforUserRole < ActiveRecord::Migration
  def up
  	change_column :users, :role, :integer, :default => 4
  end

  def down
  	change_column :users, :role, :integer, :default => nil
  end
end
