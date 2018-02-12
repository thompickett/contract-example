require_relative "./body"
require_relative "./header"

class Base

  attr_reader :body,
              :headers

  def initialize
    validate_contract_setup
    @body = Body.new({
      pattern: body_pattern
    })
    @headers = contract_headers
  end

  def status
    200
  end

  private

    def validate_contract_setup
    end
end
