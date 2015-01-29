class CommentsController < ApplicationController


  def create
      @post = Post.find(params[:post_id])
      @comment = current_user.comments.new(comment_params)
      @comment.post = @post
      @new_comment = Comment.new

      authorize @comment

#How do you redirect the code once the comment has been submitted?
      if @comment.save
        flash[:notice] = "Comment was created."
      else
        flash[:error] = "Comment failed to save."
      end

  end

private 

  def comment_params
    params.require(:comment).permit(:body)
  end

end



