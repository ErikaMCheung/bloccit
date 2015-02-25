class FavoritesController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    authorize favorite

    if favorite.save
      flash[:notice] = "Favorited"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Post was not favorited. Please try again."
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])
    authorize favorite
    
    if favorite.destroy
      flash[:notice] = "Unfavorited"
      redirect_to  [@post.topic, @post]
    else
      flash[:error] = "Post is still favorited. Please try agian."
      redirect_to [@post.topic, @post]
    end
  end

end
  
  
