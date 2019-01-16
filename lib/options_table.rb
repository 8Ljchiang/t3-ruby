# TODO: DELETE

class OptionsTable
  def initialize(args = {}); end

  def add_method(method_name, &block)
    define_singleton_method(method_name, &block)
  end
end
