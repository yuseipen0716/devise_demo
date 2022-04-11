class ArticlesController < ApplicationController
    before_action :authenticate_admin!, except: [:show, :index]

  
    def index
      @articles = Article.all.order(created_at: :desc).page(params[:page]).per(10).with_rich_text_body
      @categories = Category.all.order(created_at: :desc)
      @archives = @articles.group("strftime('%Y%m', created_at)").order(created_at: :desc).count
    end
    
    def new
      @article = Article.new
      render layout: "simple_form"
    end

    def create
      @article = Article.new(article_params)
      @articles = Article.all.order(created_at: :desc).page(params[:page]).per(10)
      @archives = @articles.group("strftime('%Y%m', created_at)").order(created_at: :desc).count
      
      if @article.save
        redirect_to @article, notice: "記事が投稿できました"
      end
    end
    
    def attach
      attachment = Attachment.create! image: params[:image]
      render json: { filename: url_for(attachment.image) }
    end

    def show
      set_article
      @categorizations = @article.categorizations.includes(:category).order(:created_at)
      @comments = @article.comments
      @comment = @article.comments.new
      render layout: "show_layout"
    end

    def edit
      set_article
      render layout: "simple_form"
    end

    def update
      set_article
      if @article.update(article_params)
        redirect_to @article, notice: "更新が完了しました"
      end
    end

    def destroy
      set_article
      @article.destroy!
      redirect_to root_path, notice: "記事を削除しました"
    end

    private
    # Use callbacks to share common setup or constaraints berween actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :body, { category_ids: [] })
    end
end
