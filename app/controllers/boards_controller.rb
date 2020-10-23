class BoardsController < ApplicationController 
  before_action :if_not_logged_in, only: [:create, :new, :edit, :update]
  before_action :set_params_id, only: [:show, :edit, :update, :destroy]

    def index 
      if params[:user_id] && @user = User.find_by_id(params[:user_id])
         @boards = @user.boards.most_bulletins
      else 
        @boards = Board.all 
      end
    end  

    def new 
      @board = Board.new
    end 

    def create 
      #byebug
      @board = current_user.boards.build(board_params)

      if @board.save 
        redirect_to board_path(@board)
      else 
        render :new 
      end
    end

    def update 
      @board.update(board_params) 

      if @board.save 
        redirect_to boards_path 
      else 
        render :edit 
      end
    end 

    def destroy 
      @board.destroy 
      redirect_to boards_path
    end

    private 

    def board_params 
        params.require(:board).permit(:month, :title, :user_id) 
    end 

    def set_params_id
      @board = Board.find(params[:id]) 
    end
  
end
