class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, :presence => true
  validates :content, :presence => true

  def number_of_comments
    return self.comments.length
  end

  def self.todays_posts
    return Post.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def self.number_of_todays_posts
    return self.todays_posts.length
  end
end
