class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    
    def set_article
        @article = Article.find(params[:id])
    end
    
    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        if @article.update(article_params) #send in the variables into the database
            flash[:notice] = "Article was saved"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    
    def destroy

        @article.destroy
        flash[:notice] = "article was successfully destroyed"
        redirect_to root_path
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    private
    def article_params
        params.require(:article).permit(:title, :description)
    end
end