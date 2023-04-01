class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @menu = Menu.find(params[:menu_id])
    current_user.likes.create(menu: @menu)
    redirect_to menus_path
  end

end

