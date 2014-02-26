class Topic < ActiveRecord::Base
  belongs_to :category
  has_many :posts
  belongs_to :user

  validates :name, presence: true
  accepts_nested_attributes_for :posts
end
