class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    #authorize @comment

    if @comment.save
      flash[:notice] = "Your comment was saved"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was a problem with your comment!"
      # render :new
      redirect_to [@topic, @post]
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]

    else
      flash[:error] = "Comment was not deleted. Try again."
      redirect_to [@topic, @post]
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
