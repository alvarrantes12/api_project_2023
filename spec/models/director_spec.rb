require 'rails_helper'

RSpec.describe Director, type: :model do
  subject {
    described_class.new(first_name: "Director", last_name: "Director 1")
  }

  it "valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without first_name" do
    subject.first_name = nil 
    expect(subject).to_not be_valid
  end 

  it "is not valid without last_name" do
    subject.last_name = nil 
    expect(subject).to_not be_valid
  end 

  it "is not valid with a first_name with less than 3 letters" do
    subject.first_name = "ja"
    expect(subject).to_not be_valid 
  end

  it "is not valid with a last_name with more than 10 letters" do
    subject.last_name = "jajajajajaja"
    expect(subject).to_not be_valid 
  end
end
