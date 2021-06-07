class CategoriesController < ApplicationController
  before_action :set_category, only:[:show, :edit, :update, :destroy]
  before_action :is_same_user?, except: [:index, :new, :create]

  def index
    # @categories = Category.paginate(page: params[:page])
    @categories = Category.all
  end

  def new
    @category = Category.new
    @category.user_id = current_user.id
  end

  def show
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category created!"
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category updated!"
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to categories_url
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def is_same_user?
    @category_user = @category.user
    redirect_to(root_url) unless current_user?(@category_user) || @category.is_system
  end

  def category_params
    params.require(:category).permit(:category_name, :remarks, :is_system, :user_id)
  end
end
