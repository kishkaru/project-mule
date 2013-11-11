class RemoveUserNameFromUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :user_name
  end

  def down
  	add_column :users, :user_name
  end
end
