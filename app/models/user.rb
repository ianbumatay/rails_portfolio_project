class User < ApplicationRecord 
    has_many :bulletins 
    has_many :boards, through: :bulletins 

    has_secure_password
end


  