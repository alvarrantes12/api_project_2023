require 'rails_helper'

RSpec.describe MediaContent, type: :model do
  subject {
    described_class.new(name: "Movie",
                        director: Director.create(first_name: "John", last_name: "Black"))
  }

  it "valid with valid attributes" do 
    expect(subject).to be_valid
  end

  it "is not valid without name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
