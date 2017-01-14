class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new
		if @post.save(post_params)
			flash[:notice] = "Post 202."
			redirect_to post_path(@post)
		else
			flash[:alert] = "Post 404."
			render :new
		end
	end

	def edit
	end

	def update
		if @post.update_attributes(post_params)
			flash[:notice] = "Post Update 202."
			redirect_to post_path(@posts)
		else
			flash[:alert] = "Post Update 404."
			render :edit
		end
	end

	def show
	end

	def destroy
	end

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def find_post
		@post = Post.find(params[:id])
	end

end
