class Bank
  attr_reader  :account_holders, :name

  def initialize(name)
    @name = name
    @account_holders = []
  end

  def open_account(person)
    person.add_account(self)
    @account_holders << person
  end

  def deposit(person, deposit)
    if deposit > person.galleons
      p "#{person.name} does not have enough cash to perform this deposit."
    elsif person.galleons >= deposit
      person.accounts[self] += deposit
      person.galleons -= deposit
    end
  end


  def withdrawal(person, withdrawal)

    if withdrawal > person.accounts[self]
      p "Insufficient funds"
    elsif person.accounts[self] >= withdrawal
      person.accounts[self] -= withdrawal
      person.galleons += withdrawal
    end
  end

  def transfer(person, bank, amount)

    if !person.accounts.key?(bank)
      "Does not have an account"
    elsif person.accounts[self] >= amount
      person.accounts[self] -= amount
      person.accounts[bank] += amount
    elsif person.accounts[self] <= amount
      "Insufficient funds"
    end
  end

  def total_cash
    @account_holders.sum do |person|
      person.accounts[self]
    end
  end
end
