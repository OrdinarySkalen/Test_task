class ArticlesController < ApplicationController
 def index
  @category = Category.find(params[:category_id])
 end

 def show
  @category = Category.find(params[:category_id])
  @article = @category.articles.find(params[:id])
 end

 def new # this action doing in 'index'
 end

 def create
 @tags = Tag.all
 @category = Category.find(params[:category_id])
 @article = @category.articles.create(article_params)
 redirect_to root_url
 end

 def update
  @category = Category.find(params[:category_id])
  @article = @category.articles.find(params[:id])
  redirect_to root_url
 
   if @article.update(article_params)
     redirect_to root_url
   else
     render 'edit'
   end
 end

  def destroy
    @category = Category.find(params[:category_id])
    @article = @category.articles.find(params[:id])
    #@article = Article.find(params[:id])
    @article.destroy
 
    redirect_to categories_path
  end

 private 
   def article_params
     params.require(:article).permit(:title, :text)
   end
end
