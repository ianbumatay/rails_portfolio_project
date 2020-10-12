class BoardsController < ApplicationController 

    def index 
      @boards = Board.all 
    end  

    def new 
      @board = Board.new
    end 

    def create 
      @board = Board.new(board_params) 

      if @board.save 
        redirect_to board_path(@board) 
      else 
        render :new 
      end
    end

    def show 
      @board = Board.find(params[:id])
    end   

    def edit 
      @board = Board.find(params[:id])
    end 

    def update 
      @board = Board.find(params[:id]) 
      @board.update(board_params) 

      if @board.save 
        redirect_to boards_path 
      else 
        render :edit 
      end
    end 

    def destroy 
      @board = Board.find(params[:id]) 
      @board.destroy 
      redirect_to boards_path
    end

    private 

    def board_params 
        params.require(:board).permit(:month, :title) 
    end

  
end
