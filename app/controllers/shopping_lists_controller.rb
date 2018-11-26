class ShoppingListsController < ApplicationController
  def index
    @shopping_lists = ShoppingList.all
  end

  def new
    @shopping_list = ShoppingList.new
  end

end
