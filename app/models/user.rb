class User < ApplicationRecord 
    has_many :bulletins, dependent: :destroy
    has_many :boards, through: :bulletins 

    has_secure_password 

    validates :username, :email, presence: true, uniqueness: true
end


  