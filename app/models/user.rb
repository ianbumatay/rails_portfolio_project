class User < ApplicationRecord 
    has_many :boards
    has_many :bulletins, dependent: :destroy
    has_many :bulletin_boards, through: :bulletins 
    has_secure_password 
    validates :username, :email, presence: true, uniqueness: true  
    

  def self.from_omniauth(auth) 
    where(email: auth.info.email).first_or_initialize do |user| 
     user.username = auth.info.name 
     user.email = auth.info.email 
     user.password = SecureRandom.hex 
    end 
  end
  
  
end


  