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
    # require "pry"; binding.pry
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
    new_balance = @balance - withdrawal
      if withdrawal > @balance
        p "Insufficient funds"
      else
        p "Minerva has withdrawn #{withdrawal} galleons. Balance: #{new_balance}"
      end
  end

  def transfer(person, bank, amount)
    transer_balance = 0
    transfer_balance = bank.balance + amount
    new_balance = @balance - amount

    p "Minerva has transferred #{amount} galleons from JP Morgan Chase to #{bank.name}."

  end

end
