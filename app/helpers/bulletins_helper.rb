module BulletinsHelper

def bulletin_header(board)
  if board                        
   "Bulletins for #{board.title}" 
  else 
    "All Bulletins" 
    end
  end
end

def created_at(bulletin)
  bulletin.created_at.strftime("Created: %A, %b %e, at %l:%M %p")
end
