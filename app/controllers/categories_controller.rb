require 'pry'
class CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} added!"
      if :return_to.nil?
        redirect_to category_path(@category)
      else
        redirect_to session.delete(:return_to)
      end
    else
      flash[:info] = "Categories must be unique"
      redirect_to new_category_path
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
    session[:return_to] = request.fullpath
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "#{@category.title} edited!"
      redirect_to category_path(@category)
    else
      redirect_to edit_category_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end