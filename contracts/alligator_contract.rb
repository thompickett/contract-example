require_relative "./base_contract"

class AlligatorContract < BaseContract

    def status
      200
    end

    def headers
      { application_type: "json" }
    end

    def body
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
