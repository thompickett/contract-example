require 'spec_helper'
require_relative '../contracts/alligator'

describe "AlligatorContractSpec" do

  before do
    params = {
      param1: "Tree"
    }
    service = Service.new(:edualize)
    totals = service.get_request('/api/v1//median_expenditures/totals')
    @body = totals[:body]
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
  end

  it "Should pass" do
    alligator = Alligator.new.body.pattern
    expect_body_matches(alligator, @body)
  end

end
