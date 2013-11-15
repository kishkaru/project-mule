require 'spec_helper'

describe User do
    describe 'should return the list of nonrelational attributes' do
        User.admin_updateable_nonrelational_attributes.should == [:role,
            :password,
            :password_confirmation,
            :first_name,
            :last_name,
            :email]
    end
end
