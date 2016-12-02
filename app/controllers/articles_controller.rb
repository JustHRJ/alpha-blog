class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id]) #in order to get the current editing object
        if @article.update(article_params) #send in the variables into the database
            flash[:notice] = "Article was saved"
            redirect_to article_path(@article)
        end
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