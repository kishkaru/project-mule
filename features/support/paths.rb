# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers

    # Maps a name to a path. Used by the
    #
    #   When /^I go to (.+)$/ do |page_name|
    #
    # step definition in web_steps.rb
    #
    def path_to(page_name)
        case page_name

        when /^the home\s?page$/
            root_path

        #### ITEM ###
        when /^the all_items page$/
            items_path

        when /^the create_new_item page$/
            new_item_path

        when /^the item page for "(.*)"/
            item_path(Item.find_by_name($1).id)

        ### INGREDIENT ###
        when /^the all_ingredients page$/
            ingredients_path

        when /^the create_new_ingredient page$/
            new_ingredient_path

	### ORDER ###
	when /^the orders page$/
	    orders_path

        ### PHONE NUMBER ###
        when /^the all_phone_numbers page$/
            phone_numbers_path

        when /^the create_new_phone_number page$/
            new_phone_number_path

        ### ADDRESS ###
        when /^the all_addresses page$/
            addresses_path

        when /^the create_new_address page$/
            new_address_path

        ### VENDOR ###
        when /^the all_vendors page$/
            vendors_path

        when /^the create_new_vendor page$/
            new_vendor_path

        when /^the vendor page for "(.*)"/
            vendor_path(Vendor.find_by_name($1).id)

        ### DELIVERY POINT ###
        when /^the all_delivery_points page$/
            delivery_points_path

        when /^the Listing delivery_points page$/
            delivery_points_path

        when /^the new_delivery_point page$/
            new_delivery_point_path

        ### DELIVERY AREA ###
        when /^the Listing delivery_areas page$/
            delivery_areas_path

        when /^the New delivery_area page$/
            new_delivery_area_path

        ### MENU ###
        when /^the Show Menu page$/
            menu_path(Menu.first)

        ### USER ###
        when /^the users page$/
            users_path

        when /^the users page for "(.*)"$/
            user_path(User.find_by_email($1))

        when /^the login page$/
            user_session_path

        when /^the create account page$/
            new_user_registration_path

        when /^the edit credit cards page$/
            edit_credit_cards_path

        when /^the add new credit card page$/
            new_credit_card_path

        when /^the edit user page$/
            edit_user_registration_path

        when /^the account page$/
            account_path


            #number Add more mappings here.
            # Here is an example that pulls values out of the Regexp:
            #
            #   when /^(.*)'s profile page$/i
            #     user_profile_path(User.find_by_login($1))

        else
            begin
                page_name =~ /^the (.*) page$/
                path_components = $1.split(/\s+/)
                self.send(path_components.push('path').join('_').to_sym)
            rescue NoMethodError, ArgumentError
                raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                    "Now, go and add a mapping in #{__FILE__}"
            end
        end
    end
end

World(NavigationHelpers)
