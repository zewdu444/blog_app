class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)

    respond_to do |format|
      format.html
      format.xml  { render xml: @posts }
      format.json { render json: @posts }
    end

  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.xml  { render xml: @post.comments }
      format.json { render json: @post.comments }
    end
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
