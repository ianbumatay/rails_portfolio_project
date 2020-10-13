class BulletinsController < ApplicationController 

    def index 
      @bulletins = Bulletin.all 
    end 

    def new 
       @bulletin = Bulletin.new
    end  

    def create 
      @bulletin = Bulletin.new(bulletin_params)
       #byebug
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
        params.require(:bulletin).permit(:title, :content, :rating, :board_id, :user_id)
    end

    
end
