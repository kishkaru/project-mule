Given /the following phone numbers exist/ do |phone_numbers_table|
  phone_numbers_table.hashes.each do |phone_number|
    PhoneNumber.create!(phone_number)
  end
end
