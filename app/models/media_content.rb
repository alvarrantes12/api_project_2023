class Director < ApplicationRecord
  belongs_to :director

    validates :name, presence: true
end
