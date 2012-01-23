require "spec_helper"

describe Member do
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:contact_no)}
  it {should validate_numericality_of(:amount)}

  context "validations" do
    it "should validate amount is an integer" do
      m = Factory.build(:member, :amount => "abc")
      m.valid?

       m.errors[:amount].should == ["is not a number"]
      end

    it "should validate amount is not float" do
      m = Factory.build(:member, :amount => 98.34)
      m.valid?

       m.errors[:amount].should == ["must be an integer"]
    end
  end
end