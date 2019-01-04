class ArticlesController < ApplicationController
  def new
    @article = Article.new
    render #uznanie ze praca kontrolera zostala zakonczona, wziecie widoku 
  end

  def create
    #binding.pry
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = t('articles.create.success')
      redirect_to article_path(@article.id)
    else
      flash.now[:error] = t(
        'articles.create.error',
        problems: @article.errors.full_messages.to_sentence)
      render 'new'
    end
  end

  def index
    @articles = Article.all 

  end
  
  
  def show
    @article = Article.find(params[:id])
    #render
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = t('articles.update.success')
      redirect_to article_path(@article.id)
    else
      flash.now[:error] = t(
        'articles.update.error',
        problems: @article.errors.full_messages.to_sentence)
      render 'edit' #to do:info co się nie udało
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
