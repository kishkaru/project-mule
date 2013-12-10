Given /the following user accounts exist/ do |users_table|
    map = {'admin' => 1, 'vendor' => 2, 'server' => 3, 'customer' => 4}
    users_table.hashes.each do |user|
        phone = user.delete('phone_number')
        phone = phone.split(" ")
        user[:phone_number_attributes] = {:country => phone[0], :area => phone[1], :number => phone[2]}
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
    user = User.create!(:email => 'admin@admin.com',
        :password => 'aaaaaaaa',
        :password_confirmation => 'aaaaaaaa',
        :first_name => 'bob',
        :last_name => 'bobby',
        :phone_number_attributes => {
            :area => '123',
            :number => '123-1231',
            :country => '1'
            })
    user.update_attribute(:role, User::ADMIN)
end

Given /a non admin account is set up/ do
    user = User.create!(:email => 'a@b.com',
        :password => 'bbbbbbbb',
        :password_confirmation => 'bbbbbbbb',
        :first_name => 'bob',
        :last_name => 'bobby',
        :phone_number_attributes => {
            :area => '123',
            :number => '123-1231',
            :country => '1'
            })
    user.update_attribute(:role, User::CUSTOMER)
end

Given /I am logged in with an admin account/ do
    step %{I am on the home page}
    step %{I follow "Login"}
    step %{I fill in "user_email" with "admin@admin.com"}
    step %{I fill in "user_password" with "aaaaaaaa"}
    step %{I press "Sign in"}
end

Given /I am logged in with a user account/ do
    step %{I am on the home page}
    step %{I follow "Login"}
    step %{I fill in "user_email" with "a@b.com"}
    step %{I fill in "user_password" with "bbbbbbbb"}
    step %{I press "Sign in"}
end

Given /I logout/ do
    click_link('user-menu')
    click_link('logout-link')
end
