require 'rails_helper'

RSpec.describe MediaContent, type: :model do
  subject {
    described_class.name(name: "Movie",
                         director: Director.create(first_name: "Jonh", last_name: "Black"))
  }
if "valid with valid attributes" do
  expect(subject).to be_valid
end
end
