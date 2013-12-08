Given /the following vendors exist/ do |vendors_table|
    vendors_table.hashes.each do |vendor|
    	address = vendor.delete("address")
	    pattern = /(.*), (.*), (.*), (.*)/
	    match = pattern.match(address)
	    address_attr = {:line1 => match[1],
	      :city => match[2],
	      :state => match[3],
	      :zip => match[4]}
	    vendor[:address_attributes] = address_attr
        Vendor.create!(vendor)
    end
end
