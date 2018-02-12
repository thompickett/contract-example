class BaseContract

  def initialize
    validate
  end

  private

  def validate
    validate_definitions_present
    validate_definition_formats
  end

  def validate_definitions_present
    raise "Must define 'status' in #{self.class}" if !self.class.instance_methods.include?(:status)
    raise "Must define 'headers' in #{self.class}" if !self.class.instance_methods.include?(:headers)
    raise "Must define 'body' in #{self.class}" if !self.class.instance_methods.include?(:body)
  end

  def validate_definition_formats
    raise "'#{self.class}.status' must return set to Integer, ex. '200'" if status.class != Integer
    raise "'#{self.class}.headers' must return Hash, ex. { application_type: \"json\" }" if headers.class != Hash
    raise "'#{self.class}.body' must return Hash or Array" if body.class != Hash && body.class != Array
  end
end
