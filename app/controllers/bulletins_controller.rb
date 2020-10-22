class BulletinsController < ApplicationController  
  before_action :if_not_logged_in, only: [:create, :new, :edit, :update]
  before_action :set_board_if_nested, only: [:index, :new] 
  #before_action :params_id, only: [:show, :edit, :update, :destroy]

    def index 
       
      if @board 
        @bulletins = @board.bulletins
      else 
        #flash[:message] = "Board does not exist!" 
        @bulletins = Bulletin.alpha
      end
    end 

    def new                                                
      if @board                                       
         @bulletin = @board.bulletins.build 
      else 
        #flash[:message] = "Board does not exist!"
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

    def set_board_if_nested 
      @board = Board.find_by_id(params[:board_id]) if params[:board_id]
      #@board = params[:board_id] && @board = Board.find_by_id(params[:board_id])
    end 

    def params_id 
      @bulletin = Bulletin.find(params[:id])
    end

end
