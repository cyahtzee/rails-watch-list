class ListsController < ApplicationController
  def home
  end

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def delete
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
