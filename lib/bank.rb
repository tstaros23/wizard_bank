class Bank
  def initialize(name)
    @name = name
    @bank_account = []
    @balance = 0
  end

  def open_account(person)
    @bank_account << person
  end

  def deposit(person, deposit)
    cash = person.galleon - deposit
    @balance += deposit
    if deposit > person.galleon
      p "insufficient funds"
    else
      p "#{deposit} galleons have been deposited into Minerva's Chase account. Balance: #{deposit} cash: #{cash}"
    end
  end

  def withdrawal(person, withdrawal)
    new_balance = @balance - withdrawal
      if withdrawal > @balance
        p "Insufficient funds"
      else
        p "Minerva has withdrawn #{withdrawal} galleons. Balance: #{new_balance}"
      end
  end

end
