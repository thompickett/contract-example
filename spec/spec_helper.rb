require 'pry'
require 'rspec'
require 'faraday'
require 'json'

class Service

  def initialize(url_key)
    @conn = Faraday.new(base_urls[url_key])
  end

  def get_request(uri, params = {})
    response = @conn.get do |request|
      request.url = uri
      params.each do |key, value|
        request.params[key] = value
      end
    end
    {
      status: response.status,
      headers: response.headers,
      body: parse_body(response)
    }
  end

  def parse_body(response)
    JSON.parse(response.body)
  end

  private

    def base_urls
      {
        localhost: "https://localhost:3000",
        ong: "https://ais.qa.blah.blah",
        edualize: "https://edualize.herokuapp.com/"
      }
    end

end

def assert_format_equal(contract_object, actual_object)
  expect(contract_object.class).to eq(actual_object.class)
  if contract_object.class == Array
    if_array(contract_object, actual_object)
  elsif contract_object.class == Hash
    if_hash(contract_object, actual_object)
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
