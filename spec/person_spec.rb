require 'rspec'
require './lib/person'

RSpec.describe Person do
  it "exists" do
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Luna", 500)

    expect(person1).to be_a(Person)
    expect(person2).to be_a(Person)
  end

  it "has attributes" do
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Luna", 500)

    expect(person1.name).to eq("Minerva")
    expect(person2.name).to eq("Luna")
    expect(person1.galleon).to eq(1000)
    expect(person2.galleon).to eq(500)
  end
end
