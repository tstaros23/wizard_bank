class Person
  attr_accessor :galleons
  attr_reader :name, :accounts

  def initialize(name, galleons)
    @name = name
    @galleons = galleons
    @accounts = Hash.new(0)
  end
  # hash that includes bank as a key and balance as value
  def add_account(bank)
    @accounts[bank.name] = 0
  end
end
