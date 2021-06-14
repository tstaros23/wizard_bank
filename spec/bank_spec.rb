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

    expect(chase.deposit(person1)).to eq([1000])
    require "pry"; binding.pry


  end
end
