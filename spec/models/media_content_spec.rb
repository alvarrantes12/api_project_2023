require 'rails_helper'

RSpec.describe MediaContent, type: :model do
  subject {
    described_class.new(name: "TestName",
                        director: Director.create(first_name: "Jhon,", last_name: "Black"))
  }

  it "valid with valid attributes" do
    expect(subject).to be_valid
  end
end
