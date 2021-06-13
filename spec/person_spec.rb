require 'rspec'
require './lib/person'

RSpec.describe Person do
  it "exists" do
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Luna", 500)

    expect(person1).to eq(Person)
    expect(person2).to eq(Person)
  end
