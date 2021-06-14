class Bank
  def initialize(name)
    @name = name
    @bank_account = []
  end

  def open_account(person)
    @bank_account << person
  end

  def deposit(person, deposit)
    cash = person.galleon - deposit
    @bank_account << cash
    if deposit > person.galleon
      p "insufficient funds"
    else
      p "#{deposit} galleons have been deposited into Minerva's Chase account. Balance: #{deposit} cash: #{cash}"
    end
  end


  def withdrawal(person, balance)
    @bank_account

  end
end
