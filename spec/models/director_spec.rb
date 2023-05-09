require 'rails_helper'

RSpec.describe Director, type: :model do
  subject {
    described_class.new(first_name: 'Director',
                        last_name: 'Director 1')
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a first name' do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a last name' do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a first_name with less than 3 letters' do
    subject.first_name = 'Jo'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a last_name with more than 10 letters' do
    subject.last_name = 'Abcdefghijklanopqrstu'
    expect(subject).to_not be_valid
  end
end
