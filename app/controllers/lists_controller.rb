class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :update, :destroy]
#  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy] 


  def index
  	@lists = List.all
  end

  def new
  	@list = List.new
  end
 
  def edit
  end

  def create
  	@list = List.new(list_params)
  	@list.author_id = current_author.id
  	respond_to do |format|
  	  if @list.save
  	  	format.html { redirect_to @list, notice: '入力が完了しました！！'}
  	  	format.json { render :show, status: :created, locaation: @list }
  	  else
  	  	format.html { render :new}
  	  	format.json { render json: @list.errors, status: :unprocessable_entity }
  	  end
    end
  end

  def update
  	rspond_to do |format|
  		if @list.update(list_params)
  		  format.html { redirect_to @list, notice: '更新しました！！'}
  		  format.json { render :show, status: :ok, location: @list }
        else 
          format.html { render :edit }
          format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	@list.destroy
  	respond_to do |format|
  		format.html { redirect_to lists_url, notice: '消去しました！！'}
  		format.json { head :no_content }
  	end
  end

  private

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:category_id, :memo, :user_id, :amount)  
    end
end