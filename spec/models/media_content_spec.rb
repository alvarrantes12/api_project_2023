require 'rails_helper'

RSpec.describe MediaContent, type: :model do
  subject {
    described_class.new(name: "movie",
                        director: Director.create(first_name: "john", last_name: "black"))
  }

  it "valid with valid attributes" do
    expect(subject).to be_valid
  end
end
