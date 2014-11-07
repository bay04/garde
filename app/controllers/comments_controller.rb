class CommentsController < ApplicationController
  before_action :set_comments, only: [:show, :edit, :destroy, :update]


  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.all
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comments_param)
    if @comment.save
      redirect_to [@post, @comment]
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @comment.destroy
    redirect_to @post
  end

  private

  def set_comments
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def comments_param
    params.require(:comment).permit(:author, :comment_body)
  end

end
