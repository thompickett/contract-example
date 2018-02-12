require 'spec_helper'
require_relative '../contracts/alligator'

describe "AlligatorContractSpec" do

  before do
    @incoming = [
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
    expect_body_matches(alligator, @incoming)
  end

end
