# This is the controller for displaying the posts.
class PostsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
      authorize @post
  end

# This is the controller for creating posts.
  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post.topic = @topic
    authorize @post
    
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

# This is the controller for editing the posts on the main page.
  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end   
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
