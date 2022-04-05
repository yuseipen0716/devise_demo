class ArticlesController < ApplicationController
    def index
      @articles = Article.all
    end
    
    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)

      respond_to do |format|
        if @article.save
          format.html { redirect_to article_url(@article), notice: "記事を新規作成しました" }
          format.json { render :show, status: :created, location: @article }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    def show
      set_article
    end

    def edit
      set_article
    end

    def update
      set_article
      if @article.update(article_paramas)
        redirect_to @article, notice: "更新が完了しました"
      end
    end

    private
    # Use callbacks to share common setup or constaraints berween actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content)
    end
end
