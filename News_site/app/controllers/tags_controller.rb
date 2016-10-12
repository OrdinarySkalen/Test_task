class TagsController < ApplicationController
 def index
   @tags = Tag.all
   @articles = Article.all
 end

 def new
   @tag = Tag.new
 end
 
 def show
   @tag = Tag.find(params[:id])
 end
 
 def edit
   @tag = Tag.find(params[:id])
 end

 def create
   @tag = Tag.new(tag_params)
 
  if @tag.save
    redirect_to root_url
  else
    render 'new'
  end
 end

 def update
  @tag = Tag.find(params[:id])
 
   if @tag.update(tag_params)
     redirect_to root_url
   else
     render 'edit'
   end
 end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
 
    redirect_to category_path
  end

 private
  def tag_params
    params.require(:tag).permit(:value)
  end
end
