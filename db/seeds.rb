# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create an admin account
admin = User.create!(:email => "admin@admin.com", :password => "iambatman", :password_confirmation => "iambatman", :phone_number_attributes => {:area => "123", :number => "123-4567", :country => "1"}, :first_name => "Mule", :last_name => "Admin")
admin.update_attribute(:role, User::ADMIN)