class CategoriesController < ApplicationController
  before_action :authenticate_admin!, except: [:show, :index]
  
  def index
    @categories = Category.all
    render layout: "simple"
  end

  def new
    @category = Category.new
    render layout: "simple_form"
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: "カテゴリーを追加しました"
    end
  end

  def show
    set_category
    @categorizations = @category.categorizations.includes(:article).order(:created_at).page(params[:page]).per(10)
    @articles = Article.all.order(created_at: :desc).page(params[:page]).per(10)
    @archives = @articles.group("strftime('%Y%m', created_at)").order(created_at: :desc).count
  end

  def edit
    set_category
  end

  def update
    set_category
    if @category.update(category_params)
      redirect_to categories_path, notice: "カテゴリー名を変更しました"
    end
  end

  def destroy
    set_category
    @category.destroy!
    redirect_to categories_path, notice: "カテゴリーの削除に成功しました"
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
