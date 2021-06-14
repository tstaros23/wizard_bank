class Person
  attr_accessor :galleon
  attr_reader(:name)
  def initialize(name, galleon)
    @name = name
    @galleon = galleon
  end
end
