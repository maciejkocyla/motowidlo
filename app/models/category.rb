class Category < ActiveRecord::Base

  has_many :subcategories, class_name: "Category", foreign_key: "overcategory_id"
  belongs_to :overcategory, class_name: "Category"
  has_many :topics

  validates :name, presence: true 
end
