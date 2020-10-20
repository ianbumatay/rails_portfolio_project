class Board < ApplicationRecord 
    belongs_to :user
    has_many :bulletins, dependent: :destroy
    has_many :users, through: :bulletins
    validates :title, presence: true 

    scope :most_bulletins, -> { joins(:bulletins).group("board.id").order("count(boards.id) desc")}
end


