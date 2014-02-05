class AddCategoryRefToTopic < ActiveRecord::Migration
  def change
    add_reference :topics, :category, index: true
  end
end
