class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    redirect_back(fallback_location: root_path)   #いいねを押しても元いた同じページに戻る
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)   #いいねを押しても元いた同じページに戻る
  end

  def favorites
    @favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @favorites_list = Post.where(id: @favorites).page(params[:page]).per(9)     # postsテーブルから、お気に入り登録済みのレコードを取得
  end

end
