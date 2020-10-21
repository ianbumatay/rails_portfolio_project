class BulletinsController < ApplicationController 
 # before_action :set_board_if_nested, only: [:index, :new, :create]

    def index 
         @error = "nested"
      if params[:board_id] && @board = Board.find_by_id(params[:board_id])
        @bulletins = @board.bulletins
      else 
        @error = "Board does not exist!"
        @bulletins = Bulletin.alpha
      end
    end 

    def new                                                
      if params[:board_id] && @board = Board.find_by_id(params[:board_id])                                       
         @bulletin = @board.bulletins.build 
      else 
        @error = "Board does not exist!"
        @bulletin = current_user.bulletins.build 
      end
    end  

    def create 
      #byebug
      @bulletin = current_user.bulletins.build(bulletin_params)
      
      if @bulletin.save 
        redirect_to bulletin_path(@bulletin)
      else 
        render :new 
      end
    end

    def show 
      @bulletin = Bulletin.find(params[:id])
    end   

    def edit 
      @bulletin = Bulletin.find(params[:id])
    end 

    def update 
      @bulletin = Bulletin.find(params[:id]) 
      @bulletin.update(bulletin_params) 

      if @bulletin.save 
        redirect_to bulletin_path(@bulletin)
      else 
        render :edit 
      end
    end 

    def destroy 
      @bulletin = Bulletin.find(params[:id])
      @bulletin.destroy 
      redirect_to bulletins_path 
    end

    private 

    def bulletin_params 
        params.require(:bulletin).permit(:title, :content, :rating, :board_id)
    end

end
