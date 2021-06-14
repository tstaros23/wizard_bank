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
    wells_fargo = Bank.new("Wells Fargo")
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Luna", 500)

    expect(chase.open_account(person1)).to eq([person1])

  end
  it "can deposit galleons" do

    chase = Bank.new("JP Morgan Chase")
    wells_fargo = Bank.new("Wells Fargo")
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Luna", 500)

    expect(chase.deposit(person1, 750)).to eq("750 galleons have been deposited into Minerva's Chase account. Balance: 750 cash: 250")
    expect(chase.deposit(person1, 5000)).to eq("insufficient funds")

  end
  it "can withdraw galleons" do

    chase = Bank.new("JP Morgan Chase")
    wells_fargo = Bank.new("Wells Fargo")
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Luna", 500)

    expect(chase.deposit(person1, 500)).to eq("500 galleons have been deposited into Minerva's Chase account. Balance: 500 cash: 500")

    chase.deposit(person1, 500)
    expect(chase.withdrawal(person1, 250)).to eq("Minerva has withdrawn 250 galleons. Balance: 250")


  end
end
