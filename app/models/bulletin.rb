class Bulletin < ApplicationRecord
    belongs_to :user 
    belongs_to :board 
    
    validates :title, :content, presence: true
end



