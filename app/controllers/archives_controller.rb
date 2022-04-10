class ArchivesController < ApplicationController
  def show
    articles = Article.all
    @archives = articles.group("strftime('%Y%m', created_at)").order(created_at: :desc).count
    @yyyymm = params[:yyyymm]
    @articles = articles.where("strftime('%Y%m', articles.created_at) = '"+@yyyymm+"'").page(params[:page]).per(10).order(created_at: :desc)
  end
end
