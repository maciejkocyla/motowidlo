class AddFootnoteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :footnote, :text
  end
end
