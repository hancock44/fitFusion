class LikesController < ApplicationController
  before_action :find_post
  before_action :authenticate_user!
  
  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to post_path(@post)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to post_path(@post)
  end
  
  private
  def find_post
    @post = Post.find(params[:post_id])
  end

end
