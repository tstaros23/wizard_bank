require 'rspec'
require './person'
require './bank'

RSpec.describe Bank do
  it 'exists' do
    chase = Bank.new("JP Morgan Chase")

    expect(chase).to be_a(Bank)
  end

  it "can open an account for a person" do
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)

    chase.open_account(person1)
    expect(person1.accounts).to eq({chase => 0})

  end

  it "can deposit galleons" do
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)

    chase.open_account(person1)
    chase.deposit(person1, 750)

    expect(person1.galleons).to eq(250)

    expected = {
      chase => 750
    }

    expect(person1.accounts).to eq(expected)

    chase.deposit(person1, 5000)

    expect(chase.deposit(person1, 5000)).to eq("Minerva does not have enough cash to perform this deposit.")

  end

  it "can withdraw galleons" do

    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)


    chase.open_account(person1)

    chase.deposit(person1, 500)
    chase.withdrawal(person1, 250)


    expect(person1.galleons).to eq(750)

    expect(chase.withdrawal(person1, 25000)).to eq('Insufficient funds')

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
    person2 = Person.new("Luna", 500)

    chase.open_account(person1)
    wells_fargo.open_account(person1)
    chase.deposit(person1, 750)

    chase.transfer(person1, wells_fargo, 250)
    expect(person1.accounts[wells_fargo]).to eq(250)

    expect(person1.accounts[chase]).to eq(500)

    chase.open_account(person2)
    chase.deposit(person2, 250)

    expected = "Does not have an account"

    expect(chase.transfer(person2, wells_fargo, 200)).to eq(expected)
  end

  it "has a cash total" do

    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)


    chase.open_account(person1)
    chase.deposit(person1, 750)

    expect(chase.total_cash).to eq(750)
  end
end
