class Topic < ActiveRecord::Base
  belongs_to :category
  has_many :posts, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  accepts_nested_attributes_for :posts

  def hot?(number = 5)
     if self.posts.any?
       self.posts.last.created_at <= number.days.from_now 
     else return false
     end
  end

  def how_fresh?
    ((Time.now - self.posts.last.created_at)/(3600 * 24)).to_i if self.posts.any?
  end

  def date_of_last_activity 
    if self.posts.any?
      self.posts.last.created_at
    else
      self.created_at
    end
  end

  searchable do
    
    text :name, :boost => 10
    text :heading

    text :posts do
      posts.map { |post| post.content }
    end
  end
end
