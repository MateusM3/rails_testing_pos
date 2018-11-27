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

  def edit
  end

  def create
    @shopping_list = ShoppingList.new(shopping_list_params)

    respond_to do |format|
      if @shopping_list.save
        format.html {redirect_to shopping_list_url(@shopping_list),
                                 notice: 'Shopping List was successfully created.'}
        format.json {render :show, status: :created, location: @shopping_list}
      else
        format.html {render :new}
        format.json {render json: @shopping_list.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @shopping_list.update(shopping_list_params)
        format.html {redirect_to @shopping_list, notice: 'Shopping List was successfully updated.'}
        format.json {render :show, status: :ok, location: @shopping_list}
      else
        format.html {render :edit}
        format.json {render json: @shopping_list.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @shopping_list.destroy
    respond_to do |format|
      format.html { redirect_to shopping_lists_url, notice: 'Shopping List was successfully destroyed.' }
      format.json { head :no_content }
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
