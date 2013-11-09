Given /the following user accounts exist/ do |users_table|
	map = {'admin' => 1, 'vendor' => 2, 'server' => 3, 'customer' => 4}
	users_table.hashes.each do |user|
		user_to_make = User.new
		user.keys.each do |k|
			val = user[k]
			if (k == :role || k == 'role')
				val = map[user[k]]
			end
			user_to_make.send("#{k}=", val)
		end
		user_to_make.save!
	end
end

Given /the admin account is set up/ do
	user = User.create(:email => 'admin@admin.com',
		:password => 'aaaaaaaa',
		:password_confirmation => 'aaaaaaaa')
	user.update_attribute(:role, User::ADMIN)
end

Given /a non admin account is set up/ do
	user = User.create(:email => 'a@b.com',
		:password => 'bbbbbbbb',
		:password_confirmation => 'bbbbbbbb')
	user.update_attribute(:role, User::CUSTOMER)
end

Given /I am logged in with an admin account/ do
	step %{I press "Login"}
	step %{I fill in "email" with "admin@admin.com"}
	step %{I fill in "password" with "aaaaaaaa"}
	step %{I press "Sign in"}
end

Given /I am logged in with a user account/ do
	step %{I press "Login"}
	step %{I fill in "email" with "a@b.com"}
	step %{I fill in "password" with "bbbbbbbb"}
	step %{I press "Sign in"}
end