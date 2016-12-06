class CategoriesController < ApplicationController
   before_action :set_category, only: [:show, :edit, :update]
   before_action :require_admin, only: [:new, :create, :edit, :update]
   
   def require_admin
      if !logged_in? || !current_user.admin?
         flash[:danger] = "You are not authorized to modify or create content"
         redirect_to categories_path
      end
   end
   
   def show

      @category_articles = @category.articles.paginate(page: params[:page], per_page: 3)
   end
   
   def edit

   end
   
   def update

      if @category.update(category_params)
         flash[:success] = "Successfully edited"
         redirect_to category_path(@category)
      else
         render 'edit'
      end
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
   
   def set_category
      @category = Category.find(params[:id])
   end
   

end