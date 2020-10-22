module BulletinsHelper

  def bulletin_header(board)
    if board                        
     "Bulletins for #{board.title}" 
    else 
     "All Bulletins in Alpahbetical Order." 
     end
   end


  def bulletin_new_header(board)
    if board 
      "New Bulletins for #{board.title}" 
    else 
       "New Bulletin" 
     end 
   end


  def created_at(bulletin)
    bulletin.created_at.strftime("Created: %A, %b %e, at %l:%M %p")
  end 

end
