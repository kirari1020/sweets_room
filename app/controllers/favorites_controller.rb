class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: @post.id)
    favorite.save
    # app/views/favorites/create.js.erbを参照する
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
    # app/views/favorites/destroy.js.erbを参照する
  end

  def favorites
    @favorites = Favorite.where(user_id: params[:user_id]).pluck(:post_id)  # ユーザーのお気に入りのpost_idカラムを取得
    @favorited_posts = Post.where(id: @favorites).page(params[:page]).per(9)     # postsテーブルから、お気に入り登録済みのレコードを取得
  end

end
