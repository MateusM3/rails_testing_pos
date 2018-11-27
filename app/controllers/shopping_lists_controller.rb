class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: [:show, :edit, :update, :destroy]

  def index
    @shopping_lists = ShoppingList.all
  end

  def show
  end

  def new
    @shopping_list = ShoppingList.new
  end

  def create
    @shopping_list = ShoppingList.new(shopping_list_params)

    respond_to do |format|
      if @shopping_list.save
        format.html {redirect_to shopping_list_url(@shopping_list),
                                 notice: 'Shopping Lists was successfully created.'}
        format.json {render :show, status: :created, location: @shopping_list}
      else
        format.html {render :new}
        format.json {render json: @shopping_list.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def set_shopping_list
    @shopping_list = ShoppingList.find(params[:id])
  end

  def shopping_list_params
    params.require(:shopping_list).permit(:title, :was_bought)
  end

end
