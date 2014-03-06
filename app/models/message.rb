class Message < ActiveRecord::Base

  belongs_to :recipient, class_name: "User"
  belongs_to :author, class_name: "User"

  validate :recipient_id, presence: true
  validates :author_id, presence: true
end
