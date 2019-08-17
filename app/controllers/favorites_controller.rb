class FavoritesController < ApplicationController
  # 追記箇所
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = "お気に入りに追加しました。"
    redirect_to root_url
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = "お気に入りから削除しました。"
    redirect_to root_url
  end
end
