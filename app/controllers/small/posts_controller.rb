class Small::PostsController < ApplicationController
  before_action :check_logged_in, only: [:new, :create, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to new_small_post_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private
    def check_logged_in
      not_found unless user_signed_in?
    end
  
    def post_params
      params.require(:post).permit(:body_text, :emotion_level)
    end
end
