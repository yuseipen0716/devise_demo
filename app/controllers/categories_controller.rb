class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render layout: "category_simple"
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: "カテゴリーを追加しました"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
