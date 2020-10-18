class Board < ApplicationRecord 
    has_many :bulletins 
    has_many :users, through: :bulletins
    validates :title, :month, presence: true
end


