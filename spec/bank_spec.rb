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

  it "has people's bank accounts" do
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)

    expect(chase.open_account(person1)).to eq("An account has been opened for Minerva with JP Morgan Chase")

  end
  it "can deposit galleons" do

    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)
    expect(chase.deposit(person1, 0)).to eq("Minerva does not have an account with JP Morgan Chase")

    chase.open_account(person1)

    expect(chase.deposit(person1, 750)).to eq("750 galleons have been deposited into Minerva's JP Morgan Chase account. Balance: 750 cash: 250")
    expect(chase.balance).to eq(750)
    expect(person1.galleon).to eq(250)
    expect(chase.deposit(person1, 5000)).to eq("Minerva does not have enough cash to perform this deposit.")

  end
  xit "can withdraw galleons" do

    chase = Bank.new("JP Morgan Chase")
    wells_fargo = Bank.new("Wells Fargo")
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Luna", 500)

    expect(chase.deposit(person1, 500)).to eq("500 galleons have been deposited into Minerva's Chase account. Balance: 500 cash: 500")
  end

  it "does not allow too big of a withdrawal" do

    chase = Bank.new("JP Morgan Chase")
    wells_fargo = Bank.new("Wells Fargo")
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Luna", 500)

    chase.deposit(person1, 500)
    chase.withdrawal(person1, 10)

    expect(chase.withdrawal(person1, 600)).to eq("Insufficient funds")

  end
  it "can transfer" do
    chase = Bank.new("JP Morgan Chase")
    wells_fargo = Bank.new("Wells Fargo")
    person1 = Person.new("Minerva", 1000)


    expect(chase.transfer(person1, wells_fargo, 250)).to eq("Minerva has transferred 250 galleons from JP Morgan Chase to Wells Fargo.")
  end
end
