require './lib/ceo'

RSpec.describe Ceo do

  describe "setup" do
    # it "exists" do
    #   ceo = Ceo.new(15,20)
    # end
    it "has base_salary and bonus attributes" do
      ceo = Ceo.new(15,20,"CEO", 0)
      expect(ceo.base_salary).to eq(15)
      expect(ceo.bonus).to eq(20)
      expect(ceo.total_compensation).to eq(35)
    end
  end

  # describe "Has a name, ID, and total_compensation" do
  #   # it "has name and id" do
  #   # Write tests to prove that a Ceo instance can have a Name and ID number, like any other Employee.
  #   # Also, the CEO should be able to receive a total compensation. Write at least one test that proves they can access this method.
  # end

end