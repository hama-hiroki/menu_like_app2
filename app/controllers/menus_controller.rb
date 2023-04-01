class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]

  def index
    @pasta_menus = Menu.where(genre: "Pasta")
    @appetizer_menus = Menu.where(genre: "Appetizers")
    @dessert_menus = Menu.where(genre: "Dessert")
    @special_drink_menus = Menu.where(genre: "Special Drink")

    def like
      menu = Menu.find(params[:id])
      menu.likes.create(user_id: current_user.id)
      redirect_to menus_path
    end
    
  end

  def show
  end

  def new
    @menu = Menu.new
  end

  def edit
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      redirect_to @menu, notice: 'Menu was successfully created.'
    else
      render :new
    end
  end

  def update
    if @menu.update(menu_params)
      redirect_to @menu, notice: 'Menu was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @menu.destroy
    redirect_to menus_url, notice: 'Menu was successfully destroyed.'
  end

  private

    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:name, :description, :image_url, :genre).merge(user_id: current_user.id)
    end

    def move_to_index
      unless user_signed_in?
        redirect_to action: :index
      end
    end


end
