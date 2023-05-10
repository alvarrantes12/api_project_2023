require 'rails_helper'

RSpec.describe MediaContent, type: :model do
  subject {
    described_class.new(name: "Music",
                        director: Director.create(first_name: "Ruben", last_name: "Loria"))
  }

  it "valid with valid attributes" do
    expect(subject).to be_valid
  end
end