require 'rails_helper'

RSpec.describe MediaContent, type: :model do
  subject {
    described_class.new(name: "Movie",
                        director: Director.create(first_name: "John", last_name: "Black"))
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
end