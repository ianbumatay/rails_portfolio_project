class User < ApplicationRecord 
    has_may :bulletins 
    has_many :boards, through: :bulletins
end

