class User < ApplicationRecord
  has_many :articles
  validates :username, presence: true, uniqueness: true
  validates :email, format: { with: /\A([a-zA-Z0-9_\-.]+)@([a-zA-Z0-9_\-.]+)\.([a-zA-Z]{2,5})\z/ }
end
