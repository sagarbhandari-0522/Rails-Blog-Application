class Category < ApplicationRecord
  validates :name, presence: true, length: { in: 6..20 }, uniqueness: true
end
