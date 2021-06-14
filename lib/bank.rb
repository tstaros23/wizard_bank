class Bank
  def initialize(name)
    @name = name
    @bank_account = []
  end

  def open_account(person)
    @bank_account << person
  end

  def deposit(person)
    @bank_account << person.galleon
  end

  def withdrawal()
  end
end
