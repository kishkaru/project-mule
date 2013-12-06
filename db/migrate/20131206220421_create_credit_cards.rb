class CreateCreditCards < ActiveRecord::Migration
  def up
  	create_table :credit_cards do |t|
  		t.string :token
  		t.string :last_four

  		t.timestamps
  	end
  end

  def down
  end
end
