class LikesController < ApplicationController
    before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user: current_user)
    redirect_to posts_path, notice: "You liked the post!"
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])
    @like.destroy
    redirect_to posts_path, notice: "You unliked the post."
  end
end
