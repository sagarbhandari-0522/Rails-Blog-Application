# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :category_ids, presence: true
end
