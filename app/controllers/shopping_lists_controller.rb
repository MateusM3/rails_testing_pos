class ShoppingListsController < ApplicationController
  def index
    @shopping_lists = ShoppingList.all
  end

end
