module BoardsHelper 

    def board_header(user)

      if user                      
        "Board with most BuLLetins"
      else 
        "All Boards" 
      end
    end
end
