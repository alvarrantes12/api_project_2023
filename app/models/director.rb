class Director < ApplicationRecord
  has_many :midia_contents
  
  validates :first_name, presence: true, length: { minimum: 3 }
  validates :last_name, presence: true, length: { minimum: 3, maximun: 10 }
end
