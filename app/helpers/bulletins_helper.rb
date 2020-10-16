module BulletinsHelper

    def bulletin_header(board)
      if board                        
        "Board for #{board.month}" 
      else 
        "All Bulletins" 
      end
    end
end
