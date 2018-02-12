require 'spec_helper'
require_relative '../contracts/alligator_contract'

describe "AlligatorContractSpec" do

  # before do
  #   params = {
  #     param1: "Tree"
  #   }
  #   service = Service.new(:edualize)
  #   @totals = service.get_request('/api/v1//median_expenditures/totals')
  # end

  before do
    @body = [
      {
        name: "foo",
        age: "value",
        diseases: [
          {
            key: [
              1,
              2
            ]
          }
        ]
      }
    ]
    @headers = { application_type: "json" }
    @status = 200
  end

  it "Should pass" do
    contract = AlligatorContract.new
    # assert_format_equal(contract.body, @totals.body)
    # assert_format_equal(contract.body, @totals.headers)
    # expect(contract.status).to eq(@totals.status)
    assert_format_equal(contract.body, @body)
    assert_format_equal(contract.headers, @headers)
    expect(contract.status).to eq(@status)
  end

end
