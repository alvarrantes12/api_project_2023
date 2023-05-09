class Director < ApplicationRecord

    validates :last_name, presence: true, length: { minimum: 3 }
    validates :first_name, presence: true, length: { minimum: 3, maximum: 10 }
end
