class ArticlesController < ApplicationController
    before_action :authenticate_admin!, except: [:show, :index]

  
    def index
      @articles = Article.all.order(created_at: :desc).page(params[:page]).per(10)
      @categories = Category.all.order(created_at: :desc)
      @archives = @articles.group("strftime('%Y%m', created_at)").order(created_at: :desc).count
      
      # ↑controller内にこういうロジックみたいなのは書かない方がいいのだろうけど、どうにもならず、書いた。モデルの方で処理できるように書き直したいところ
    end
    
    def new
      @article = Article.new
      render layout: "simple_form"
    end

    def create
      @article = Article.new(article_params)

      respond_to do |format|
        if @article.save!
          format.html { redirect_to article_url(@article), notice: "記事を新規作成しました" }
          format.json { render :show, status: :created, location: @article }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
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

    def archives
      @articles = Article.all
      @archives = @articles.group("strftime('%Y%m', created_at)").order(created_at: :desc).count
    end

    def edit
      set_article
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
