class Board < ApplicationRecord 
    has_many :bulletins, dependent: :destroy
    has_many :users, through: :bulletins
    validates :month, presence: true 

    scope :most_bulletins, -> { joins(:bulletins).group("board.id").order("count(boards.id) desc")}
end


