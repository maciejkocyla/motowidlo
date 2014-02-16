class Topic < ActiveRecord::Base
  belongs_to :category
  has_many :posts

  validates :name, presence: true
end
