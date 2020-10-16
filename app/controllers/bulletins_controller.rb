class BulletinsController < ApplicationController 

    def index 
      id = params[:board_id]
      if id && @board = Board.find(id) 
        @bulletins = @board.bulletins
      else
        @bulletins = Bulletin.all  
      end
    end 

    def new 
      id = params[:board_id] 
      if id && @board = Board.find(id) 
        @bulletin = @board.bulletins.build 
      else 
        @bulletin = current_user.bulletins.build 
      end
    end   

    def create 
      #byebug
      @bulletin = current_user.bulletins.create(bulletin_params)
      
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
        params.require(:bulletin).permit(:title, :content, :rating, :user_id, :board_id)
    end

    
end
