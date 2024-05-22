class PostsController < ApplicationController

  def new
    @post = Current.user.posts.build
  end

  def create
    @post = Current.user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post), notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
