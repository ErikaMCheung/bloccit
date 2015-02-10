class CommentsController < ApplicationController


  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment

    if @comment.save
      redirect_to [@topic, @post], notice: "Comment was created."
    else 
      redirect_to [@topic, @post], alert: "Comment failed to save."
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end
  
private 

  def comment_params
    params.require(:comment).permit(:body)
  end

end



