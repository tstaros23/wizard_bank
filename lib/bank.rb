class Bank
  attr_reader  :account_holders, :name

  def initialize(name)
    @name = name
    # @bank_account = bank_account
    @account_holders = Hash.new(0)
  end

  def open_account(person)
    person.accounts[@name] = 0
    # p "An account has been opened for #{person.name} with #{@name}"
  end

  def deposit(person, deposit)
    if deposit > person.galleons
      p "Minerva does not have enough cash to perform this deposit."
    elsif person.galleons >= deposit
      person.accounts[@name] += deposit
      person.galleons -= deposit
    end
  end
    # has_account = @bank_account.find do |p|
    #   p == person
    # end
    # if !has_account
    #   p "#{person.name} does not have an account with #{@name}"
    #
    # elsif deposit > person.galleon
    #   p "#{person.name} does not have enough cash to perform this deposit."
    # else
    #   cash = person.galleon -= deposit
    #   @bank_account += deposit
    #   p "#{deposit} galleons have been deposited into #{person.name}'s #{@name} account. Balance: #{deposit} cash: #{cash}"
    # end
  # end

  def withdrawal(person, withdrawal)

      if withdrawal > @bank_account
        p "Insufficient funds"
      else
        @bank_account -= withdrawal
        p "Minerva has withdrawn #{withdrawal} galleons. Balance: #{@bank_account}"
      end
  end

  def transfer(person, bank, amount)
    has_account = @bank_account.find do |p|
      p == person
    end
    if !has_account
      p "#{person.name} does not have an account with #{@name}."
    elsif
      amount > account_holders
      p "Insufficent funds"
    else
      account_holders -= amount
      transfer_balance = account_holders += amount


      p "Minerva has transferred #{amount} galleons from #{@name} to #{bank.name}.
      Your #{@name} bank account has a balance of #{account_holders}
      Your #{bank.name} bank account has a balance of #{transfer_balance}"
      # require "pry"; binding.pry
    end

  end

end
