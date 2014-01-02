class AddImageurlToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :imageUrl, :string
  end
end
