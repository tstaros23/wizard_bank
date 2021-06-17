require 'rspec'
require './person'
require './bank'

RSpec.describe Bank do
  it 'exists' do
    chase = Bank.new("JP Morgan Chase")
    wells_fargo = Bank.new("Wells Fargo")

    expect(chase).to be_a(Bank)
    expect(wells_fargo).to be_a(Bank)
  end

  xit "has people's bank accounts" do
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)

    expect(chase.open_account(person1)).to eq("An account has been opened for Minerva with JP Morgan Chase")
    expect(chase.account_holders).to eq({:person1 => 0})

  end

  it "can deposit galleons" do
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)

    chase.open_account(person1)
    chase.deposit(person1, 750)

    expect(person1.galleons).to eq(250)

    expected = {
      "JP Morgan Chase" => 750
    }

    expect(person1.accounts).to eq(expected)

    chase.deposit(person1, 5000)

    expect(chase.deposit(person1, 5000)).to eq("Minerva does not have enough cash to perform this deposit.")
    # chase.open_account(person1)

    # expect(chase.deposit(person1, 750)).to eq("750 galleons have been deposited into Minerva's JP Morgan Chase account. Balance: 750 cash: 250")
    # expect(chase.balance).to eq(750)
    # expect(person1.galleon).to eq(250)
    # expect(chase.deposit(person1, 5000)).to eq("Minerva does not have enough cash to perform this deposit.")

  end

  xit "can withdraw galleons" do

    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)

    expect(chase.deposit(person1, 0)).to eq("Minerva does not have an account with JP Morgan Chase")

    chase.open_account(person1)

    chase.deposit(person1, 250)
    expect(chase.withdrawal(person1, 250)).to eq("Minerva has withdrawn 250 galleons. Balance: 0")
    expect(chase.withdrawal(person1, 300)).to eq("Insufficient funds")
  end

  xit "does not allow too big of a withdrawal" do

    chase = Bank.new("JP Morgan Chase")
    wells_fargo = Bank.new("Wells Fargo")
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Luna", 500)

    chase.deposit(person1, 500)
    chase.withdrawal(person1, 10)

    expect(chase.withdrawal(person1, 600)).to eq("Insufficient funds")

  end
  xit "can transfer" do
    chase = Bank.new("JP Morgan Chase")
    wells_fargo = Bank.new("Wells Fargo")
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Luna", 500)

    chase.open_account(person1)

    chase.deposit(person1, 250)
    expect(chase.transfer(person1, wells_fargo, 250)).to eq("Minerva has transferred 250 galleons from JP Morgan Chase to Wells Fargo.
    Your JP Morgan bank account has a balance of 0.
    Your Wells Fargo bank account has a balance of 250")
    expect(chase.transfer(person2, wells_fargo, 250)).to eq("Luna does not have an account with JP Morgan Chase.")
    expect(chase.balance).to eq(0)
    expect(wells_fargo.balance).to eq(250)
    expect(person1.galleon).to eq(750)
  end
end
