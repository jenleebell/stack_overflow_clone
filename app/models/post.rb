class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, :presence => true
  validates :content, :presence => true

  def number_of_comments
    return number = self.comments.length
  end
end
