class Bank
  attr_reader :balance, :name
  def initialize(name)
    @name = name
    @bank_account = []
    @balance = 0
  end

  def open_account(person)
    @bank_account << person
    p "An account has been opened for #{person.name} with #{@name}"
  end

  def deposit(person, deposit)
    has_account = @bank_account.find do |p|
      p == person
    end
    if !has_account
      p "#{person.name} does not have an account with #{@name}"

    elsif deposit > person.galleon
      p "#{person.name} does not have enough cash to perform this deposit."
    else
      cash = person.galleon -= deposit
      @balance += deposit
      p "#{deposit} galleons have been deposited into #{person.name}'s #{@name} account. Balance: #{deposit} cash: #{cash}"
    end
  end

  def withdrawal(person, withdrawal)

      if withdrawal > @balance
        p "Insufficient funds"
      else
        @balance -= withdrawal
        p "Minerva has withdrawn #{withdrawal} galleons. Balance: #{@balance}"
      end
  end

  def transfer(person, bank, amount)
    has_account = @bank_account.find do |p|
      p == person
    end
    if !has_account
      p "#{person.name} does not have an account with #{@name}."
    elsif
      amount > @balance
      p "Insufficent funds"
    else
      @balance -= amount
      transfer_balance = @balance += amount

      p "Minerva has transferred #{amount} galleons from #{@name} to #{bank.name}.
      Your #{@name} bank account has a balance of #{@balance}
      Your #{bank.name} bank account has a balance of #{transfer_balance}"
      # require "pry"; binding.pry
    end

  end

end
