class User < ActiveRecord::Base
  has_secure_password
  has_many :posts

  validates_uniqueness_of :email
end
