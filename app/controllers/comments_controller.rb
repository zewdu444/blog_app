class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author = @user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to request.referrer, notice: 'Comment was successfully created.' }
        format.json { render Json: @comment, status: :created }
      else
        format.html { render :new }
        format.json { render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
