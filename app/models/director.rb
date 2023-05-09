class Director < ApplicationRecord
    validates :first_name, presence: true, length: { minimum: 3 }
    validares :last_name, presence: true, length: { minimum: 3, maximum: 10 }
end
