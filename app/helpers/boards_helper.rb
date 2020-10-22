module BoardsHelper 

    def board_header(user)

      if user                      
        "Boards with most BuLLetins are by: #{user.username}"
      else 
        "All Bulletins in Alphabetical Order." 
      end
    end
end
