class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
      flash[:notice] = 'Post was successfully created.'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
      flash[:notice] = 'Post was successfully updated.'
    end
  end

  private

  def permitted_post_params
    [
      :user_id,
      :image,
      :content,
      :tags,
    ]
  end

  def post_params
    params.require(:post).permit(permitted_post_params)
  end

end
