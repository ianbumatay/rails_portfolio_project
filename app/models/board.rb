class Board < ApplicationRecord 
    has_many :bulletins, dependent: :destroy
    has_many :users, through: :bulletins
    validates :month, presence: true
end


