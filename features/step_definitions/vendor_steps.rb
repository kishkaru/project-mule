Given /the following vendors exist/ do |vendors_table|
    vendors_table.hashes.each do |vendor|
        Vendor.create!(vendor)
    end
end
