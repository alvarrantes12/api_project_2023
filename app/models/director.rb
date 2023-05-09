class Director < ApplicationRecord
    has_many :media_contents
    
    validates :first_name, presence: true, length: { minimum: 3 }
    validates :last_name, presence: true, length: { minimum: 3, maximum: 10 }
  end
  
