class AddOvercategoryIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :overcategory_id, :integer
  end
end
