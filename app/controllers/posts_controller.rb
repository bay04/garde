class PostsController < ApplicationController
before_action :set_post, only: [:show, :edit, :update, :destroy] 


	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post, notice: "Post added successfully"
		else
			redirect_to action: 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: 'Post was successfully updated.'
		else
			render action: 'new'
		end
	end

	def show
	end

	def destroy
		@post.destroy
		redirect_to posts_url
	end

	private
	def set_post
		@post = Post.find(params[:id])
	end
	def post_params
		params.require(:post).permit(:title, :body)
	end

end

