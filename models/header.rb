class Header

  attr_reader :attributes

  def initialize(options)
    @attributes = options[:attributes]
  end

end
