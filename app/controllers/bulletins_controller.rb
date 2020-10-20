class BulletinsController < ApplicationController 
  before_action :set_board_if_nested, only: [:index, :new, :create]

    def index 
                      #id = params[:board_id]
      if  @board            #id && @board = Board.find(id) 
        @bulletins = @board.bulletins
      else
        @bulletins = Bulletin.all  
      end
    end 

    def new                                                 #id = params[:board_id] 
      if @board                                             #id && @board = Board.find(id) 
         @bulletin = @board.bulletins.build 
      else 
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
        params.require(:bulletin).permit(:title, :content, :rating, :user_id, :board_id)
    end

    def set_board_if_nested 
      @board = Board.find_by_id(params[:board_id]) if params[:board_id] 
    end
    
end
