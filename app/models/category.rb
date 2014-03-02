class Category < ActiveRecord::Base

  has_many :subcategories, class_name: "Category", foreign_key: "overcategory_id", :dependent => :destroy
  belongs_to :overcategory, class_name: "Category"
  has_many :topics, :dependent => :destroy

  validates :name, presence: true 


end
