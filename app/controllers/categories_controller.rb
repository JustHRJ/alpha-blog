class CategoriesController < ApplicationController
   before_action :require_admin, only: [:new, :create]
   
   def require_admin
      if !logged_in? || !current_user.admin?
         flash[:danger] = "You are not authorized to create"
         redirect_to categories_path
      end
   end
   
   def show
      @category = Category.find(params[:id])
      @category_articles = @category.articles.paginate(page: params[:page], per_page: 3)
   end
   
   def index
      @categories = Category.paginate(page: params[:page], per_page: 3)
   end
   
   def create
      @category = Category.new(category_params)
      if @category.save
         flash[:success] = "You have created a new Category"
         redirect_to categories_path
         
      else
         render 'new'
      end
   end
   
   def new
      @category = Category.new
   end
   
   private 
   def category_params
      params.require(:category).permit(:name)
   end
   

end