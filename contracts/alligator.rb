require_relative "../models/base"

class Alligator < Base

  private

    def contract_headers
      { application_type: "json" }
    end

    def body_pattern
      [
        {
          name: "",
          age: "",
          diseases: [
            {
              key: [
                0,
                0
              ]
            }
          ]
        }
      ]
    end

end
