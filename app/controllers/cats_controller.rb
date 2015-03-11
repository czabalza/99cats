class CatsController < ApplicationController
  def new
    @title = "Create a new cat!"
    @submit = "Create cat"
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = Cat.find(params[:id])
    @title = "Edit #{@cat.name}"
    @submit = "Update #{@cat.name}"
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
  end
end
