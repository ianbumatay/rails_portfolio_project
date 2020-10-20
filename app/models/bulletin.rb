class Bulletin < ApplicationRecord
    belongs_to :user 
    belongs_to :board 
   
    validates :title, :content, presence: true 

    def self.latest_bulletins
      where("created_at >=?", Time.zone.today.beginning_of_day)
    end

end



