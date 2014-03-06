class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :author_id
      t.integer :recipient_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
