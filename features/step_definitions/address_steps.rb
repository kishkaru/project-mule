Given /the following addresses exist/ do |addresses_table|
  addresses_table.hashes.each do |address|
    Address.create!(address)
  end
end
