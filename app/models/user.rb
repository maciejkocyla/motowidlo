class User < ActiveRecord::Base

  has_many :posts
  has_many :topics
  has_many :interests
  has_many :likes, through: :interests, source: :category

  has_secure_password

  before_save { self.email = email.downcase }
  before_save :create_remember_token, :set_last_seen

  validates :password, length: { minimum: 6 }
  validates :name, presence: true, length: { maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def activities
    active = Array.new 
    self.posts.last(10).each do |post| 
      active.push(post.topic) unless active.include?(post.topic)
    end 
    return active
  end

  private

    def create_remember_token
      if self.remember_token.nil?
        self.remember_token = User.encrypt(User.new_remember_token)
      end
    end

    def set_last_seen
      self.last_seen = Time.now
    end
end
