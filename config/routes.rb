Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :reviews, only: [:create, :index]
  end
end

class ResturantsController < ApplicationController
  def index
    @resturants = resturant.all
  end

  def show
    @resturant = resturant.find(params[:id])
  end

  def new
    @resturant = resturant.new
  end

  def create
    resturant = resturant.create(resturant_params)

    redirect_to resturant_path(resturant)
  end

  def edit
    @resturant = resturant.find(params[:id])
  end

  def update
    @resturant = resturant.find(params[:id])

    @resturant.update(resturant_params)

    redirect_to resturant_path(@resturant)
  end

  def destroy
    @resturant = resturant.find(params[:id])
    @resturant.destroy

    redirect_to resturants_path
  end

  private

  def resturant_params
    params.require(:resturant).permit(:name, :motto)
  end

end


