require 'pry'
require 'rspec'

def base_urls
  {
    localhost: "https://localhost:3000",
    ong: "https://ais.qa.blah.blah"
  }
end

def expect_body_matches(contract_object, actual_object)
  expect(contract_object.class).to eq(actual_object.class)
  if contract_object.class == Array
    if_array(contract_object, actual_object)
  elsif contract_object.class == Hash
    if_hash(contract_object)
  end
end

def if_array(contract_object, actual_object)
  expected_length = contract_object.length + 1
  expected_length.times do |i|
    expect(contract_object[i].class).to eq(actual_object[i].class)

    if contract_object[i].class == Array
      if_array(contract_object[i], actual_object[i])
    elsif contract_object[i].class == Hash
      if_hash(contract_object[i], actual_object[i])
    end

  end
end

def if_hash(contract_object, actual_object)
  contract_keys = contract_object.keys
  actual_keys = actual_object.keys

  contract_values = contract_object.values
  actual_values = actual_object.values

  expect(contract_keys).to eq(actual_keys)
  if_array(contract_values, actual_values)
end
