class ShoppingList < ActiveRecord::Base
  has_many :products, dependent: :destroy
  accepts_nested_attributes_for :products, reject_if: lambda { |a| a[:name].blank? }, allow_destroy: true
end
