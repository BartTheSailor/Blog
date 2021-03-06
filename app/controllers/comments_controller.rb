class CommentsController < ApplicationController
# TODO zdefiniować i wykorzystać abilities

  before_action :load_article

  def create
    if params[:picture_id].present?
      @picture = @article.pictures.find(params[:picture_id])
    end
    
    @comment = (@picture || @article).comments.new(comment_params)
    if @comment.save
      flash[:success] = t('comments.create.success')
    
      if @picture.present?
        redirect_to article_picture_path(@article.id, @picture.id)
      else
        redirect_to article_path(@article.id)
      end
    else
      flash.now[:error] = t(
        'comments.create.error',
        problems: @article.errors.full_messages.to_sentence
      )
      if @picture.present?
        render 'pictures/show'
      else
        render 'articles/show'
      end
    end
end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def load_article #wspólne dla wszystkich metod/ czyli dla wszystkich akcji tego kontrollera
    @article = Article.find(params[:article_id])
  end
end
