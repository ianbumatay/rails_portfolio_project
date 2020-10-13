class Board < ApplicationRecord 
    has_many :bulletins 
    has_many :users, through: :bulletins
end


# has_many :users, through: :visits